//
//  DateTableViewInteractorOutput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

protocol DateTableViewInteractorOutput: AnyObject {

    //    // загрузка еще дат успешно произведена
    //    func didLoad(moreDates: [String])
    //    // булевозначение для пагинации сколла
    //    func didLoad(pagination: Bool)
    
    // ошибка пустой массив с датами
    func didRecevie(error: String)
    
    // загрузка дат успешно произведена
    func didLoad(dates: [String])
}
