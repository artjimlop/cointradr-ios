//
//  CoinsListPresenter.swift
//  CoinTrader
//
//  Created by Arturo on 22/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation

class CoinsListPresenter {
    private var view : CoinsListView?
    
    init() {
        
    }
    
    func initialize(view: CoinsListView) {
        self.view = view
        let coin = CoinModel(id : "BTC",
                             name : "Bitcoin",
                             symbol : "BTC",
                             rank : 1,
                             priceUSD : 1000.0,
                             priceBTC : 1.0,
                             dayVolumeUSD : 10.0,
                             marketCapUSD : 100.0,
                             availableSupply : 1000.0,
                             totalSupply : 1.0,
                             percentChangeHour : 1.0,
                             percentChangeDay : 1.0,
                             percentChangeWeek : 1.9,
                             lastUpdated : 1)
        let coins = [coin]
        self.view!.showCoins(coins: coins)
    }
}
