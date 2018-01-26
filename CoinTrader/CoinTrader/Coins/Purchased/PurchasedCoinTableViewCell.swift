//
//  PurchasedCoinTableViewCell.swift
//  CoinTrader
//
//  Created by Arturo on 26/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import UIKit

class PurchasedCoinTableViewCell: UITableViewCell {

    @IBOutlet weak var totalMoney: UILabel!
    @IBOutlet weak var changePercentage: UILabel!
    @IBOutlet weak var purchasedPrice: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var coinName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
