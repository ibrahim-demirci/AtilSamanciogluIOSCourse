//
//  ViewController.swift
//  MVVMCryptoCurrencyApp
//
//  Created by İbrahim Demirci on 18.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    private var cryptoListViewModel: CryptoListViewModel!
    
    var colorArray =  [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
            UIColor(red: 75/255, green: 76/255, blue: 56/255, alpha: 1.0),
            UIColor(red: 100/255, green: 55/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 15/255, green: 150/255, blue: 12/255, alpha: 1.0),
            UIColor(red: 100/255, green: 150/255, blue: 23/255, alpha: 1.0),
            UIColor(red: 37/255, green: 34/255, blue: 1/255, alpha: 1.0),
            UIColor(red: 200/255, green: 147/255, blue: 89/255, alpha: 1.0),


            
        ]
        
        getData()
        
    }
    
    func getData() {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        CryptoService().downloadCurrencies(url: url) {
            (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoListViewModel != nil ? cryptoListViewModel.numberOfRowsInSection() : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceLabel.text = cryptoViewModel.name
        cell.currencyLabel.text = cryptoViewModel.price
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
        
    }


}

