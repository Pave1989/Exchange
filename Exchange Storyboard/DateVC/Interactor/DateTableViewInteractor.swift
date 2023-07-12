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
    var monthInteractor: Double = 0.0

    //сюда приходит значение от вью
    func loadMonth(month: Double) {
        self.monthInteractor = month
    }
    //сюда возвращять значение monthInt - 1!!!
    func loadDate() {
        
        datesServise.getData(month: monthInteractor) {
            [weak self] result in
            switch result {
            case.success(let data):
                
                self?.output?.didLoad(dates: data)
            case.failure(_):
                let error = "данные отсутствуют"
                self?.output?.didRecevie(error: error)
            }
        }
    }
}
