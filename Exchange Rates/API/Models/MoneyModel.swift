//
//  MoneyModel.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 26.04.2023.
//

import Foundation

struct MoneyModel: Codable {
    let success: Bool
    let timestamp: Int
    let base: String
    let date: String
    let rates: Rates
}

struct Rates: Codable {
    let RUB: Double
}
