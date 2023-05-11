//
//  RateServiceProtocol.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 23.04.2023.
//

import Foundation

protocol RateServiceProtocol {
    func getUSD(date1: String,completion: @escaping (Result<MoneyModel?, Error>) -> Void)
    func getEUR(date1: String, completion: @escaping (Result<MoneyModel?, Error>) -> Void)
}
