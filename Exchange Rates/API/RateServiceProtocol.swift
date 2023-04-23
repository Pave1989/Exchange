//
//  RateServiceProtocol.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 23.04.2023.
//

import Foundation

protocol RateServiceProtocol {
    func getRate(complition: @escaping ([String]) -> Void)
}
