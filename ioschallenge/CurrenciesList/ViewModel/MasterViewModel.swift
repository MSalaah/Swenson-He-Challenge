//
//  MasterViewModel.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/23/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import Foundation
import Moya
import RxSwift

protocol CurrencyViewDelegate: class {
    
    func updateCurrencyPicker()
    
    func updateRatesTable()
    
    func showError()
}

class MasterViewModel {
    
    weak var view: CurrencyViewDelegate?
    
    var provider: MoyaProvider<CurrencyApi>!
    
    let disposeBag = DisposeBag()

    var currencies = [Currency]()
    
    var rates = [CurrencyRate]()

    init(provider: MoyaProvider<CurrencyApi>) {
        self.provider = provider
    }
    
    func onViewDidLoad() {
        // get all available currencies
        getCurrencies()
    }
    
    func onBaseCurrencyChanged(_ baseCurrency: String) {
        // Do Stuff When Base Currency Changed
        getLatestRates(baseCurrency)
    }
    
    fileprivate func getCurrencies() {
        provider.rx.request(.fetchAllAvailableCurrencies)
            .filterSuccessfulStatusCodes()
            .map(SymbolResponse.self)
            .subscribe(onSuccess: { [weak self] (response) in
                self?.currencies = response.symbols.map { Currency(code: $0.key, name: $0.value) }
                self?.view?.updateCurrencyPicker()
                }, onError: { [weak self]  error in
                    print(error.localizedDescription)
                    self?.view?.showError()
            }).disposed(by: disposeBag)
    }
    
    fileprivate func getLatestRates(_ baseCurrency: String) {
        provider.rx.request(.fetchLatestRates("EUR"))
            .filterSuccessfulStatusCodes()
            .map(ConverterResponse.self)
            .subscribe(onSuccess: { [weak self] (response) in
                self?.rates = response.rates.map {CurrencyRate(currencyIso: $0.key, rate: $0.value) }
                self?.view?.updateRatesTable()
                }, onError: { [weak self]  error in
                    self?.view?.showError()
            }).disposed(by: disposeBag)
    }
}
