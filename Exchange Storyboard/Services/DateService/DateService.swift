//
//  DateService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

class DateService: DateServiceProtocol {

    func getData(complition: @escaping ([String]) -> Void) {

        //установка форматы даты
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM yyyy"

        var dates = [String]() //пустой массив хранения дат

        //для операций со сложением/вычитанием времени(дни, месяцы, годы)
        var past = DateComponents()
        past.year = -33 //за 33 года ибо API не поддерживает больший диапазон

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
        complition(dates)
    }
}
