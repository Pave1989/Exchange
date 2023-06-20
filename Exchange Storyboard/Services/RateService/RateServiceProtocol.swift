//
//  RateServiceProtocol.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol RateServiceProtocol {
    
    func getUSD(date1: String,completion: @escaping (Result<MoneyModel?, Error>) -> Void)
    func getEUR(date1: String, completion: @escaping (Result<MoneyModel?, Error>) -> Void)
}
