//
//  CurrencyApi.swift
//  ioschallenge
//
//  Created by Mohamed Salah on 4/23/21.
//  Copyright © 2021 SWENSON HE. All rights reserved.
//

import Moya

enum CurrencyApi {
    case fetchLatestRates(String)
    case fetchAllAvailableCurrencies
    case convert(String, String , Double)
}

extension CurrencyApi: TargetType {
    
    var baseURL: URL { return URL(string: Constants.baseUrl)! }
    
    var path: String {
        switch self {
        case .fetchLatestRates:
            return "/latest"
        case .fetchAllAvailableCurrencies:
            return "/symbols"
        case .convert:
            return "convert"
        }
    }
    
    var method: Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .fetchLatestRates(let baseCurrency):
            return .requestParameters(parameters: ["access_key": Constants.apiKey, "base": baseCurrency], encoding: URLEncoding.queryString)
        case .fetchAllAvailableCurrencies:
            return .requestParameters(parameters: ["access_key": Constants.apiKey], encoding: URLEncoding.queryString)
        case .convert(let from, let to, let amount):
            return .requestParameters(parameters: ["access_key": Constants.apiKey, "from": from, "to": to, "amount": amount], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var validate: Bool { 
        return true
    }
}
