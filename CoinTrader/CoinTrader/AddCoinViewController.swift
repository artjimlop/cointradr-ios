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
    
    @IBAction func onAddCoinPress(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let currency = Currency(context: context)
        let selectedCurrency = currencies[coinPicker.selectedRow(inComponent: 0)]
        currency.quantity = Double(amountText.text!)!
        currency.purchasedPrice = Double(priceText.text!)!
        currency.name = selectedCurrency.name
        currency.lastKnownPrice = selectedCurrency.priceUSD
        currency.symbol = selectedCurrency.symbol
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.amountText.delegate = self
        self.priceText.delegate = self
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            self.currencies = try context.fetch(CurrencyIdentifier.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
