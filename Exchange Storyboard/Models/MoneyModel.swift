//
//  MoneyModel.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

// MoneyModel
struct MoneyModel: Codable {
    let meta: Meta?
    let data: DataClass?
}
// Валюта в которой показывать курс
struct DataClass: Codable {
    let rub: Rub?

    enum CodingKeys: String, CodingKey {
        case rub = "RUB"
    }
}
// Rub
struct Rub: Codable {
    let code: String?
    let value: Double?
}
// Meta
struct Meta: Codable {
    let lastUpdatedAt: Date?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedAt = "last_updated_at"
    }
}
