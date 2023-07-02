//
//  DateTableViewInput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//

import Foundation

protocol DateTableViewInput: AnyObject {
    
//    // булево значение для скрола
//    func showPagination(pagination: Bool)
//    // Показать во view еще даты
//    func showMoreDate(date:[String])
    
    // Показать во view даты
    func showDate(date:[String])
    
    // Показать во view ошибку
    func showError(error: String)
}
