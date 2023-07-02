//
//  DateService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

class DateService: DateServiceProtocol {

    func getData(complition: @escaping (Result<[String], Error>) -> Void) {

        //установка форматы даты
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM yyyy"

        var dates = [String]() //пустой массив хранения дат

        //для операций со сложением/вычитанием времени(дни, месяцы, годы)
        var past = DateComponents()
        past.year = -10 //за 33 года ибо API не поддерживает больший диапазон

        var date = Date() //текущая дата
        //для того чтобы указать тип календаря(григарианский или другой)
        let calendar = Calendar.current
        let lastDate = calendar.date(byAdding: past, to: date)

        var dayAgoComponent = DateComponents()
        dayAgoComponent.day = -1 //вычитаем по дню

        while (date != lastDate) {
            date = calendar.date(byAdding: dayAgoComponent, to: date)!
            dates.append(dateFormater.string(from: date))
        }

        if dates == [] {
            complition(.failure(NetworkingError.invalidData))
        }else{
        complition(.success(dates))
        }
    }
}
//class DateService: DateServiceProtocol {
//
//    var isPaginating = false
//
//    func getData(pagination: Bool = false, complition: @escaping (Result<[String], Error>) -> Void) {
//        if pagination {
//            isPaginating = true
//        }
//        //Планирует выполнение блока с использованием указанных атрибутов и немедленно возвращает управление.
//        DispatchQueue.main.asyncAfter(deadline: .now() + /*(pagination ? 3 : 2)*/ 0.1, execute: {
//            //установка форматы даты
//            let dateFormater = DateFormatter()
//            dateFormater.dateFormat = "dd MMMM yyyy"
//
//            var dates = [String]() //пустой массив хранения дат
//
//            //для операций со сложением/вычитанием времени(дни, месяцы, годы)
//            var past = DateComponents()
//            past.month = -1
////            past.year = -33 //за 33 года ибо API не поддерживает больший диапазон
//
//            var date = Date() //текущая дата
//            //для того чтобы указать тип календаря(григарианский или другой)
//            let calendar = Calendar.current
//            let lastDate = calendar.date(byAdding: past, to: date)
//
//            var dayAgoComponent = DateComponents()
//            dayAgoComponent.day = -1 //вычитаем по дню
//
//            while (date != lastDate) {
//                date = calendar.date(byAdding: dayAgoComponent, to: date)!
//                dates.append(dateFormater.string(from: date))
//            }
//
//            //дополнения
//            let newDates = ["10 сентября 1989","25 февраля 1991", "21 мая 2020"]
//
//        complition(.success(pagination ? newDates : dates))
//            if pagination {
//                self.isPaginating = false
//            }
//        })
//    }
//}

