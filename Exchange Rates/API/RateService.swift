//
//  RateService.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 14.04.2023.
//

import Foundation
import Alamofire
import SwiftyJSON

//создали массив строк(источник данных для таблицы)
    var myArray = [String]()
    let url = "http://data.fixer.io/api/latest"
    let key = "98371253a513f2c59a1c2f03721e979c"
    let base = "RUB"
    let symbols = "USD,EUR,CNY"

let param = ["access_key": key,
             "base": base,
             "symbols": symbols]
class GetRate {
//func getPrice(myUrl: String, parameters: [String: String]){
//    AF.request(myUrl,method: .get, parameters: parameters).responseJSON {responce in switch responce.result{
//    case .success(let value):
//        let json = JSON(value)
//        print(json)
//        self.title = "\(json["base"])"//подставление значения json формата
//        //заполнение таблицы данными
//        self.updatePrices(json: json)
//        
//    case .failure(let error):
//        print("error",error)
//    }
//        //перезагрузка данных таблицы
//        self.tableView.reloadData()
//    }
//}

func updatePrices(json: JSON){
    //тк несколько значений по ключу делаем цикл for
    for (name, price) in json["rates"]{
        //преобразование в строку json формата
        let curr = ("\(name)    \(price)")
        //добавление в массив
        myArray.append(curr)
    }
}
}
