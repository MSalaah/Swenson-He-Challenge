//
//  CalculationViewModel.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/25/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import Foundation
import Moya
import RxSwift


protocol CalculationViewDelegate: class {
    
    func updateResult(result: String)
}

class CalculationViewModel {
    
    weak var view: CurrencyViewDelegate?

    let disposeBag = DisposeBag()
    
    var provider: MoyaProvider<CurrencyApi>!
    
    var fromCurrency: String
    var toCurrency: String
    
    init(provider: MoyaProvider<CurrencyApi>, from: String, to: String) {
        self.provider = provider
        self.fromCurrency = from
        self.toCurrency = to
    }
    
    func onAmountChanged(amount: Double) {
        provider.rx.request(.convert("EGP", "EUR", amount))
            .filterSuccessfulStatusCodes()
            .subscribe(onSuccess: { [weak self] (response) in
                print(response)
                }, onError: { [weak self]  error in
                    print(error)
            }).disposed(by: disposeBag)
    }
}
