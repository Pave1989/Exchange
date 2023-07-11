//
//  DateTableViewInteractor.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

final class DateTableViewInteractor:  DateTableViewInteractorInput {
    
    weak var output: DateTableViewInteractorOutput?
    
    var datesServise = DateService()
    var monthInteractor: Int

    init(monthInt: Int) {
        self.monthInteractor = monthInt
    }
    //сюда приходит значение от вью
    // MARK: - здесь надо что то сделать
    func loadMonth(month: Int) {
        self.monthInteractor = month
        print("from interactor: \(month)")
    }
    //сюда возвращять значение monthInt - 1!!!
    func loadDate() {
        
        datesServise.getData(month: monthInteractor) {
            [weak self] result in
            switch result {
            case.success(let data):
                
                self?.output?.didLoad(dates: data)
            case.failure(_):
                let error = "ошибка загрузки дат"
                self?.output?.didRecevie(error: error)
            }
        }
    }
}
