//
//  DateService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation
import UIKit

class DateService: DateServiceProtocol {
/*
             page 1, pagesize 20
             
             page 2, page 3, page 4
             
             итд
             Если при отдаче кол-во < pagesize - значит мы уперлись в конец
             ---
             говоришь page 1, pagesize 20
             Тебе отдается первая страница и 20 элементов
             Потом говоришь page 2, pagesize 20
             Отдается вторая страница с 20..40
             ----
 Но у сервиса должна быть залоченость операции
 Либо через булевую, либо через mutex, тут опять, как хочется, так и делается
             ----
             у сервиса делаешь page и pagesize

             например 20

             При скроллинге доходя до 10 элемента дергаешь сервис - дай еще

             Сервис отдает - запихиваешь в таблицу

             И тд и тп, пока не упремся в конец
 
 ... page = page + 1 при выдаче ставить

 if response.count == pageSize {

 page = page + 1

 ну и у меня в комплишне всегда есть isNextAvailable

 Чтобы если дальше нет - вьюха об этом знала

 И отключала вечный скроллинг
 
 */

    func getData(month: Int, complition: @escaping (Result<[String], Error>) -> Void) {
        print("From Service \(month)")
            var dates = [String]() //пустой массив хранения дат
        
            //установка форматы даты
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "dd MMMM yyyy"

            //для операций со сложением/вычитанием времени(дни, месяцы, годы)
            var past = DateComponents()
            past.month = month //за 33 года ибо API не поддерживает больший диапазон

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
