//
//  DateTableViewInteractorOutput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

protocol DateTableViewInteractorOutput: AnyObject {

    // ошибка даты не загрузились
    func didRecevie(error: String)
    
    // загрузка дат успешно произведена
    func didLoad(dates: [String])
}
