//
//  AddCoinViewController.swift
//  CoinTrader
//
//  Created by Arturo on 24/1/18.
//  Copyright © 2018 Kenkozu. All rights reserved.
//

import Foundation
import UIKit

class AddCoinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var coinPicker: UIPickerView!
    
    var currencies = [CurrencyIdentifier]()
    private var appDependencies: AppDependencies?
    private var coinDataHandler: CoinDataHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalizeDependencies()
        initializeDelegates()
        loadCurrencies()
    }
    
    private func initalizeDependencies() {
        self.appDependencies = AppDependencies(appDelegate: (UIApplication.shared.delegate as! AppDelegate))
        self.coinDataHandler = appDependencies?.coinDataHandler
    }
    
    private func initializeDelegates() {
        self.amountText.delegate = self
        self.priceText.delegate = self
    }
    
    private func loadCurrencies() {
        self.currencies = (coinDataHandler?.getCurrencies())!
    }
    
    @IBAction func onAddCoinPress(_ sender: UIButton) {
        addCoin()
    }
    
    private func addCoin() {
        let selectedCurrency = currencies[coinPicker.selectedRow(inComponent: 0)]
        coinDataHandler?.addCurrency(selectedCurrency: selectedCurrency, quantity: Double(amountText.text!)!, purchasedPrice: Double(priceText.text!)!)
        _ = navigationController?.popViewController(animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
    }
}
