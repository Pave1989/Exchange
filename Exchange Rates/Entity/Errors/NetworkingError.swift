//
//  NetworkingError.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 26.04.2023.
//

import Foundation

enum NetworkingError: Error {
    case badUrl, badRequest, badResponse, invalidData
}
