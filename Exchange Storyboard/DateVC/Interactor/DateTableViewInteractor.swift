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
    
    func loadDate() {
        
        datesServise.getData { [weak self] date in
            self?.output?.didLoad(dates: date)
        }
    }
}
