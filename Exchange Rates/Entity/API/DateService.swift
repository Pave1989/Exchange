//
//  DateService.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 14.04.2023.
//

import Foundation
import UIKit

class DateService: DateServiceProtocol {

    func getData(complition: @escaping ([String]) -> Void) {

        //установка форматы даты
        let dateFormater = DateFormatter()
        dateFormater.timeStyle = DateFormatter.Style.none
        let gmtTimeZone = TimeZone(abbreviation: "GMT")
        dateFormater.timeZone = gmtTimeZone
        dateFormater.dateFormat = "yyyy-MM-dd"
//        dateFormater.dateFormat = "dd-MM-yyyy"

        var dates = [String]() //массив хранения дат

        //для операций со сложением/вычитанием времени(дни, месяцы, годы)
        var past = DateComponents()
        past.year = -1 //за 20 лет

        var date = Date() //текущая дата
        //для того чтобы указать тип календаря(григарианский или другой)
        let calendar = Calendar.current
        let lastDate = calendar.date(byAdding: past, to: date)

        var dayAgoComponent = DateComponents()
        dayAgoComponent.day = -1

        while (date != lastDate) {
            date = calendar.date(byAdding: dayAgoComponent, to: date)!
            dates.append(dateFormater.string(from: date))
        }
        complition(dates)
    }
}
