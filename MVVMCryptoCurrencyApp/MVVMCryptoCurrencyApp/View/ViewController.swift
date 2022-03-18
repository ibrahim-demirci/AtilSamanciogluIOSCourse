//
//  ViewController.swift
//  MVVMCryptoCurrencyApp
//
//  Created by İbrahim Demirci on 18.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json"
)!
        
        CryptoService().downloadCurrencies(url: url) {
            (cryptos) in
            if let cryptos = cryptos {
                
            }
            
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        cell.priceLabel.text = "$30"
        cell.currencyLabel.text = "AVAX"
        return cell
        
    }


}

