//
//  CoinModel.swift
//  CoinTrader
//
//  Created by Arturo on 22/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation

struct CoinModel {
    
    let id : String
    let name : String
    let symbol : String
    let rank : Int
    let priceUSD : Double
    let priceBTC : Double
    let dayVolumeUSD : Double
    let marketCapUSD : Double
    let availableSupply : Double
    let totalSupply : Double
    let percentChangeHour : Double
    let percentChangeDay : Double
    let percentChangeWeek : Double
    let lastUpdated : Int
    
    init(id : String,
         name : String,
         symbol : String,
         rank : Int,
         priceUSD : Double,
         priceBTC : Double,
         dayVolumeUSD : Double,
         marketCapUSD : Double,
         availableSupply : Double,
         totalSupply : Double,
         percentChangeHour : Double,
         percentChangeDay : Double,
         percentChangeWeek : Double,
         lastUpdated : Int) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.rank = rank
        self.priceUSD = priceUSD
        self.priceBTC = priceBTC
        self.dayVolumeUSD = dayVolumeUSD
        self.marketCapUSD = marketCapUSD
        self.availableSupply = availableSupply
        self.totalSupply = totalSupply
        self.percentChangeDay = percentChangeDay
        self.percentChangeHour = percentChangeHour
        self.percentChangeWeek = percentChangeWeek
        self.lastUpdated = lastUpdated
    }
}
