//
//  MasterViewController+Ext.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/25/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import Foundation
import UIKit

extension MasterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel?.currencies.count ?? 0
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel?.currencies[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyTextField.text = viewModel?.currencies[row].name
        currencyCodeLabel.text = viewModel?.currencies[row].code
    }
}

extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rates.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
        // if you do not set `shadowPath` you'll notice laggy scrolling
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        cell.isoLabel.text = viewModel?.rates[indexPath.row].currencyIso
        cell.rateLabel.text = String(format: "%.1f", viewModel?.rates[indexPath.row].rate ?? 0)
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let from = currencyCodeLabel.text else { return }
        guard let to = viewModel?.rates[indexPath.row].currencyIso else {return}
        self.navigationController?.pushViewController(Config().createCalculationModule(from, to),animated: true)
    }
}

extension MasterViewController: CurrencyViewDelegate {
    func updateCurrencyPicker() {
        pickerView.reloadAllComponents()
    }
    
    func updateRatesTable() {
        ratesTableView.reloadData()
    }
    
    func showError() {
        //TODO Show Error Message To The User
    }
}


