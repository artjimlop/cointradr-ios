//
//  SecondViewController.swift
//  CoinTrader
//
//  Created by Arturo on 19/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import UIKit

class PurchasedCurrenciesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var purchasedCoinsView: UITableView!
    var currencies = [Currency]()
    var appDependencies: AppDependencies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appDependencies = AppDependencies(appDelegate: (UIApplication.shared.delegate as! AppDelegate))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let coinDataHandler = appDependencies?.coinDataHandler
        self.currencies = (coinDataHandler?.getDataCurrencies())!
        purchasedCoinsView.delegate = self
        purchasedCoinsView.dataSource = self
        self.purchasedCoinsView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coinCell = purchasedCoinsView.dequeueReusableCell(withIdentifier: "purchasedCoinCell") as! PurchasedCoinTableViewCell!
        coinCell?.coinName.text = currencies[indexPath.row].name
        coinCell?.currentPrice.text = "$\(currencies[indexPath.row].lastKnownPrice)"
        coinCell?.purchasedPrice.text = "You paid \(currencies[indexPath.row].purchasedPrice) each"
        
        coinCell?.totalMoney.text = "$\(getDifference(currency: currencies[indexPath.row]))"
        coinCell?.changePercentage.text = "\(getChange(currency: currencies[indexPath.row]))%"
        
        if(getChange(currency: currencies[indexPath.row]) < 0.0) {
            coinCell?.totalMoney.textColor = UIColor.red
            coinCell?.changePercentage.textColor = UIColor.red
        } else {
            coinCell?.totalMoney.textColor = UIColor.green
            coinCell?.changePercentage.textColor = UIColor.green
        }
        return coinCell!
    }
    
    func getChange(currency: Currency) -> Double {
        let diff = (currency.lastKnownPrice - currency.purchasedPrice)
        let change = ((diff * 100)/currency.purchasedPrice)
        return change.truncate(places: 2)
    }
    
    func getDifference(currency: Currency) -> Double {
        let diff = (currency.lastKnownPrice - currency.purchasedPrice) * currency.quantity
        return diff.truncate(places: 2)
    }
}

extension Double
{
    func truncate(places : Int)-> Double
    {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
