//
//  CalculationViewController.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/24/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import UIKit

class CalculationViewController: UIViewController {
    
    var viewModel: CalculationViewModel?

    
    @IBOutlet weak var amountTextField: UITextField!{
        didSet { amountTextField?.addDoneCancelToolbar() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.keyboardType = .numberPad   //or .asciicapableNumberPad
        amountTextField.delegate = self
    }
}

extension CalculationViewController: UITextFieldDelegate {
    
    private func textFieldShouldReturn(textField: UITextField) -> Bool {
        // User finished typing (hit return): hide the keyboard.
        amountTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        viewModel?.onAmountChanged(amount: NumberFormatter().number(from: amountTextField.text ?? "0")?.doubleValue ?? 0)
    }
}
