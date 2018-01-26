//
//  CurrencyModel.swift
//  CoinTrader
//
//  Created by Arturo on 25/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation

struct CurrencyModel {
    
    let id : String
    let name : String
    let symbol : String
    let priceUSD : Double
    let priceBTC : Double
    
    init(id : String,
         name : String,
         symbol : String,
         priceUSD : Double,
         priceBTC : Double) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.priceUSD = priceUSD
        self.priceBTC = priceBTC
    }
}
