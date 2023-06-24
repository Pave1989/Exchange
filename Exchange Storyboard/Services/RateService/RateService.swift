//
//  RateService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation
import Alamofire

class RateService: RateServiceProtocol {
    
    private enum NeedCurrency {
        static let rubles = "RUB"
        static let dollar = "USD"
        static let euro = "EUR"
    }
    private let baseURL = "https://api.currencyapi.com/v3/historical"
    private let key = "cqqIFRgNnIcTr8MA77R6nG709YbLr1Mxumy3UNUV"
//MARK: - decoder
    private let decoder: JSONDecoder = {
       let decoder = JSONDecoder()
       decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }()
//MARK: Get Dollar
    func getUSD(date1: String,completion: @escaping (Result<MoneyModel?, Error>) -> Void) {

        let parameters = ["apikey": key,
                        "date": date1,
                        "base_currency": NeedCurrency.dollar,
                        "currencies": NeedCurrency.rubles]
        
        AF.request(baseURL, method: .get, parameters: parameters).responseDecodable(of: MoneyModel.self, decoder: decoder) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                print(error)
        }
    }
}
//MARK: Get Euro
    func getEUR(date1: String, completion: @escaping (Result<MoneyModel?, Error>) -> Void) {
        
        let parameters = ["apikey": key,
                        "date": date1,
                        "base_currency": NeedCurrency.euro,
                        "currencies": NeedCurrency.rubles]
        AF.request(baseURL, method: .get, parameters: parameters).responseDecodable(of: MoneyModel.self, decoder: decoder) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                print(error)
        }
     }
  }
}
