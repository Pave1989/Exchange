//
//  RateService.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 14.04.2023.
//

import Foundation
import Alamofire

class RateService: RateServiceProtocol {
    
    private let key = "NBalX1Apt2VWsATt8W4a0jygLUm46Ji4"
//    //MARK: - decoder
//    private let decoder: JSONDecoder = {
//       let decoder = JSONDecoder()
//       decoder.keyDecodingStrategy = .convertFromSnakeCase
//        return decoder
//    }()
    
    func getUSD(date: String, complition: @escaping (Result<MoneyModel?, Error>) -> Void) {
        
        var reqest = URLRequest(url: URL(string: "https://api.apilayer.com/fixer/\(date)?symbols=RUB&base=USD")!, timeoutInterval: Double.infinity)
        reqest.httpMethod = "GET"
        reqest.addValue(key, forHTTPHeaderField: "apikey")
        
        let task = URLSession.shared.dataTask(with: reqest) { data, response, error in
            
            guard let data = data else {
                print(String(describing: error))
                return
            }
            guard let dollarResult = try? JSONDecoder().decode(MoneyModel.self, from: data)
            else {
                complition(.failure(NetworkingError.invalidData))
                return
            }
            complition(.success(dollarResult))
        }
        task.resume()
    }
    
    func getEUR(date: String, complition: @escaping (Result<MoneyModel?, Error>) -> Void) {
    
    var reqest = URLRequest(url: URL(string: "https://api.apilayer.com/fixer/\(date)?symbols=RUB&base=EUR")!, timeoutInterval: Double.infinity)
    reqest.httpMethod = "GET"
    reqest.addValue(key, forHTTPHeaderField: "apikey")
    
    let task = URLSession.shared.dataTask(with: reqest) { data, response, error in
        
        guard let data = data else {
            print(String(describing: error))
            return
        }
        guard let euroResult = try? JSONDecoder().decode(MoneyModel.self, from: data)
        else {
            complition(.failure(NetworkingError.invalidData))
            return
        }
        complition(.success(euroResult))
    }
    task.resume()
 }
}
