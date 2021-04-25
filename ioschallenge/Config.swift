//
//  Config.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/24/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import Foundation
import Moya

class Config {
    
    func createModule() -> MasterViewController {
        
        let viewController = MasterViewController()
        
        let viewModel = MasterViewModel(provider: MoyaProvider<CurrencyApi>())
        
        viewModel.view = viewController
        
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    
    func createCalculationModule(_ from: String, _ to: String) -> CalculationViewController {
        
        let viewController = CalculationViewController()
        
        let viewModel = CalculationViewModel(provider: MoyaProvider<CurrencyApi>(),from: from, to: to)
        
//        viewModel.view = viewController
        
        viewController.viewModel = viewModel
        
        return viewController
    }
}
