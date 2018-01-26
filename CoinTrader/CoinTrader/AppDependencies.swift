//
//  AppDependencies.swift
//  CoinTrader
//
//  Created by Arturo on 22/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation

class AppDependencies {
    
    let coinsListPresenter: CoinsListPresenter
    let coinDataHandler: CoinDataHandler
    
    init(appDelegate: AppDelegate) {
        coinDataHandler = CoinDataHandler(appDelegate: appDelegate)
        coinsListPresenter = CoinsListPresenter(coinDataHandler: coinDataHandler)
    }
}
