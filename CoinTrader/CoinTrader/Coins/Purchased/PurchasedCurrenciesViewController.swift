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
        let coinCell = purchasedCoinsView.dequeueReusableCell(withIdentifier: "purchasedCoinCell") as UITableViewCell!
        coinCell?.textLabel?.text = currencies[indexPath.row].name
        coinCell?.detailTextLabel?.text = String(getDifference(currency: currencies[indexPath.row]))
        return coinCell!
    }
    
    func getDifference(currency: Currency) -> Double {
        return (currency.lastKnownPrice - currency.purchasedPrice) * currency.quantity
    }
}

