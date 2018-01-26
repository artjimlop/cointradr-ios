//
//  CoinDataHandler.swift
//  CoinTrader
//
//  Created by Arturo on 26/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation

class CoinDataHandler {
    
    private var appDelegate: AppDelegate
    
    init(appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
    }
    
    func getCurrencies() -> [CurrencyIdentifier] {
        let context = appDelegate.persistentContainer.viewContext
        do {
            return try context.fetch(CurrencyIdentifier.fetchRequest())
        } catch {
            print("Fetching Failed")
            return [CurrencyIdentifier]()
        }
    }
    
    func getDataCurrencies() -> [Currency] {
        let context = appDelegate.persistentContainer.viewContext
        do {
            return try context.fetch(Currency.fetchRequest())
        } catch {
            print("Fetching Failed")
            return [Currency]()
        }
    }
    
    func addCurrency(selectedCurrency: CurrencyIdentifier, quantity: Double, purchasedPrice: Double) {
        let context = appDelegate.persistentContainer.viewContext
        let currency = Currency(context: context)
        currency.quantity = quantity
        currency.purchasedPrice = purchasedPrice
        currency.name = selectedCurrency.name
        currency.lastKnownPrice = selectedCurrency.priceUSD
        currency.symbol = selectedCurrency.symbol
        appDelegate.saveContext()
    }
    
    func saveCurrencies(currencies: [CurrencyModel]) {
        let context = appDelegate.persistentContainer.viewContext
        var purchasedCurrencies = [Currency]()
        do {
            purchasedCurrencies = try context.fetch(Currency.fetchRequest())
        } catch {
            //TODO do something real
            print("Fetching Failed")
        }
        for currency in currencies {
            let currencyIdentifier = CurrencyIdentifier(context: context)
            currencyIdentifier.id = currency.id
            currencyIdentifier.name = currency.name
            currencyIdentifier.symbol = currency.symbol
            currencyIdentifier.priceUSD = currency.priceUSD
            currencyIdentifier.priceBTC = currency.priceBTC
            
            for purchasedCurrency in purchasedCurrencies {
                if (purchasedCurrency.symbol == currency.symbol) {
                    purchasedCurrency.lastKnownPrice = currency.priceUSD
                }
            }
            appDelegate.saveContext()
        }
    }
}
