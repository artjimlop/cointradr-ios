//
//  FirstViewController.swift
//  CoinTrader
//
//  Created by Arturo on 19/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CoinsListView {
    
    private var appDependencies: AppDependencies
    private var presenter: CoinsListPresenter
    private var coins = [CoinModel]()
    
    @IBOutlet weak var coinsView: UITableView!
    
    required init?(coder aDecoder: NSCoder) {
        appDependencies = AppDependencies()
        self.presenter = appDependencies.coinsListPresenter
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coinsView.delegate = self
        coinsView.dataSource = self
        presenter.initialize(view: self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let coinCell = coinsView.dequeueReusableCell(withIdentifier: "coinCell") as! CoinTableViewCell
        coinCell.title.text = coins[indexPath.row].name
        coinCell.subtitle.text = coins[indexPath.row].name
        coinCell.change.text = "\(coins[indexPath.row].name)"
        return coinCell
    }
    
    func showCoins(coins: [CoinModel]) {
        self.coins = coins
        self.coinsView.reloadData()
    }
}
