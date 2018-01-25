//
//  CoinsListView.swift
//  CoinTrader
//
//  Created by Arturo on 22/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation

protocol CoinsListView {
    func showCoins(coins: [CoinModel])
    func saveCurrencies(currencies: [CurrencyModel])
}
