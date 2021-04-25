//
//  CurrencyRate.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/23/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import Foundation

struct CurrencyRate: Codable {
    var currencyIso : String
    var rate : Double
}

struct SymbolResponse: Codable {
    let success : Bool
    let symbols : Dictionary<String, String>
}

struct Currency: Codable {
    var code : String
    var name : String
}
