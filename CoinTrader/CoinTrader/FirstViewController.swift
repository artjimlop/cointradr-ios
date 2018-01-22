//
//  FirstViewController.swift
//  CoinTrader
//
//  Created by Arturo on 19/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let coins = ["Bitcoin", "Monero"]
    let share = [99.99, 88.88]
    
    @IBOutlet weak var coinsView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinsView.delegate = self
        coinsView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coinCell = coinsView.dequeueReusableCell(withIdentifier: "coinCell") as! CoinTableViewCell
        coinCell.title.text = coins[indexPath.row]
        coinCell.subtitle.text = coins[indexPath.row]
        coinCell.change.text = "\(share[indexPath.row])"
        
        return coinCell
    }
}

