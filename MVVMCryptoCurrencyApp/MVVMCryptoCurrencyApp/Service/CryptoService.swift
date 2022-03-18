//
//  CryptoService.swift
//  MVVMCryptoCurrencyApp
//
//  Created by İbrahim Demirci on 19.03.2022.
//

import Foundation

class CryptoService {
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                
                if let cryptoList = cryptoList {
                    print(cryptoList)
                    completion(cryptoList)
                }
                
            }
        }.resume()
    }
}
