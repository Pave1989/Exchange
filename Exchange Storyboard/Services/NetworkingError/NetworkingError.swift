//
//  NetworkingError.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

enum NetworkingError: Error {
    
    case badUrl, badRequest, badResponse, invalidData
}
