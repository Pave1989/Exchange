//
//  DateServiceProtocol.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol DateServiceProtocol {
    
//    func getData(pagination: Bool, complition: @escaping (Result<[String], Error>) -> Void)
    func getData(complition: @escaping (Result<[String], Error>) -> Void)
}
