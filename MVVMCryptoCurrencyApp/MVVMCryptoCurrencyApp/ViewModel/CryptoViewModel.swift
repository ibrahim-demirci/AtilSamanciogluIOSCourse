//
//  CryptoViewModel.swift
//  MVVMCryptoCurrencyApp
//
//  Created by İbrahim Demirci on 19.03.2022.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList: [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurrency: CryptoCurrency
    
    var name: String {
        return cryptoCurrency.currency
    }
    
    var price: String {
        return cryptoCurrency.price
    }
}


