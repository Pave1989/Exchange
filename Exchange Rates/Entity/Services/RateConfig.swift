//
//  RateConfig.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 26.04.2023.
//

import Foundation

struct RateConfig {
    
let baseURL = "https://api.apilayer.com/fixer/"
let key = "NBalX1Apt2VWsATt8W4a0jygLUm46Ji4"
let dateRate = "2019-10-13"
let needCurrency = "RUB"
let usdCurrency = "USD"
let eurCurrency = "EUR"

    var urlGetUSD: String {
        return "\(baseURL)\(dateRate)?symbols=\(needCurrency)&base=\(usdCurrency)"
    }
    var urlGetEUR: String {
        return "\(baseURL)\(dateRate)?symbols=\(needCurrency)&base=\(eurCurrency)"
    }
}
