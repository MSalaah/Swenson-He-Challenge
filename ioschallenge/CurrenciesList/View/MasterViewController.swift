//
//  MasterViewController.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/23/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    private let cellReuseIdentifer = "CurrencyTableViewCell"
    
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var currencyCodeLabel: UILabel!
    @IBOutlet weak var ratesTableView: UITableView!
    let pickerView = UIPickerView()
    
    var viewModel: MasterViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        createPicker()
        configureRatesTableView()
        viewModel?.onViewDidLoad()
    }
    
    fileprivate func configureRatesTableView() {
        // RegisterCell
        let cell = UINib(nibName: cellReuseIdentifer ,bundle: nil)
        self.ratesTableView.register(cell, forCellReuseIdentifier: cellReuseIdentifer)
        
        ratesTableView.backgroundColor = .clear
        ratesTableView.dataSource = self
        ratesTableView.delegate = self
    }
    
    fileprivate func configureNavBar() {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.2470588235, blue: 0.4039215686, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationItem.title = "Currency Converter"
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    fileprivate func createPicker() {
        currencyTextField.textAlignment = .center
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        //assign toolbar
        currencyTextField.inputAccessoryView = toolbar
        //assign date picker to view
        currencyTextField.inputView = pickerView
        pickerView.delegate = self
    }
    
    @objc func donePressed() {
        self.view.endEditing(true)
        self.viewModel?.onBaseCurrencyChanged(currencyCodeLabel.text ?? "")
    }
}
