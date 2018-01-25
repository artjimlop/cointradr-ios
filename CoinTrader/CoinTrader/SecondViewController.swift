//
//  SecondViewController.swift
//  CoinTrader
//
//  Created by Arturo on 19/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var purchasedCoinsView: UITableView!
    var currencies = [Currency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purchasedCoinsView.delegate = self
        purchasedCoinsView.dataSource = self
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            self.currencies = try context.fetch(Currency.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

