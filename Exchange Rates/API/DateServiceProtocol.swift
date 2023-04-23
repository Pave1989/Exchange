//
//  DateServiceDelegate.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 15.04.2023.
//

import Foundation

protocol DateServiceProtocol {
    func getData(complition: @escaping ([String]) -> Void)
}
