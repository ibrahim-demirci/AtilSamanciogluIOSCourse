//
//  CryptoTableViewCell.swift
//  MVVMCryptoCurrencyApp
//
//  Created by İbrahim Demirci on 18.03.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
