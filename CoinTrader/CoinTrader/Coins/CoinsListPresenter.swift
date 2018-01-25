//
//  CoinsListPresenter.swift
//  CoinTrader
//
//  Created by Arturo on 22/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CoinsListPresenter {
    private var view : CoinsListView?
    private var coins = [CoinModel]()
    private var currencies = [CurrencyModel]()
    
    init() {
        
    }
    
    func initialize(view: CoinsListView) {
        self.view = view
        self.loadCoins()
    }
    
    private func loadCoins() {
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker").responseJSON { response in
            if let data = response.data, let _ = String(data: data, encoding: .utf8) {
                if let jsonResponse = try? JSON(data: data) {
                    self.mapCoinsResponse(jsonResponse: jsonResponse)
                    self.view!.showCoins(coins: self.coins)
                    self.view!.saveCurrencies(currencies: self.currencies)
                }
            }
        }
    }
    
    private func parseCoinModel(item: JSON) -> CoinModel {
        currencies.append(CurrencyModel(id : item["id"].stringValue,
                                        name : item["name"].stringValue,
                                        symbol : item["symbol"].stringValue,
                                        priceUSD : item["price_usd"].doubleValue,
                                        priceBTC : item["price_btc"].doubleValue))
        
        return CoinModel(id : item["id"].stringValue,
                             name : item["name"].stringValue,
                             symbol : item["symbol"].stringValue,
                             rank : item["rank"].intValue,
                             priceUSD : item["price_usd"].doubleValue,
                             priceBTC : item["price_btc"].doubleValue,
                             dayVolumeUSD : item["24h_volume_usd"].doubleValue,
                             marketCapUSD : item["market_cap_usd"].doubleValue,
                             availableSupply : item["available_supply"].doubleValue,
                             totalSupply : item["total_supply"].doubleValue,
                             percentChangeHour : item["percent_change_1h"].doubleValue,
                             percentChangeDay : item["percent_change_24h"].doubleValue,
                             percentChangeWeek : item["percent_change_7d"].doubleValue,
                             lastUpdated : item["last_updated"].intValue)
    }
    
    private func mapCoinsResponse(jsonResponse: JSON) {
        for item in jsonResponse[].arrayValue {
            print(item["id"].stringValue)
            self.coins.append(self.parseCoinModel(item: item))
        }
    }
}
