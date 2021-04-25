//
//  Converter.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/23/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import Foundation

struct Converter: Codable {
    let base : String
    let date : String
    let rates : [CurrencyRate]
}

struct ConverterResponse: Codable {
    let success : Bool
    let rates : Dictionary<String, Double>
}
