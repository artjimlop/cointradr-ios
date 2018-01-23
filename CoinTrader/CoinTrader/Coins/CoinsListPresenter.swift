//
//  CoinsListPresenter.swift
//  CoinTrader
//
//  Created by Arturo on 22/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation
import Alamofire

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
        
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}
