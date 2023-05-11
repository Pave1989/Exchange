//
//  MoneyModel.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 26.04.2023.
//

import Foundation

//struct MoneyModel: Codable {
//    let success: Bool?
//    let timestamp: Int?
//    let base: String?
//    let date: String?
//    let rates: Rates
//}
//
//struct Rates: Codable {
//    let RUB: Double
//}

// MARK: - MoneyModel
struct MoneyModel: Codable {
    let meta: Meta?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let rub: Rub?

    enum CodingKeys: String, CodingKey {
        case rub = "RUB"
    }
}

// MARK: - Rub
struct Rub: Codable {
    let code: String?
    let value: Double?
}

// MARK: - Meta
struct Meta: Codable {
    let lastUpdatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedAt = "last_updated_at"
    }
}
