//
//  DateTableViewPresenter.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

final class DateTableViewPresenter {
    
    weak var view: DateTableViewInput? //взаимодействие презентера с вью
    var interactor: DateTableViewInteractorInput
    var router: DateTableViewRouterInput
    
    init(
         interactor: DateTableViewInteractorInput,
         router: DateTableViewRouterInput) {
            self.interactor = interactor
            self.router = router
    }
}
// презентер является делегатом вью а протокол делегата ViewOutput
extension DateTableViewPresenter: DateTableViewOutput {
  
    func viewDidLoad() {
        
        interactor.loadDate()
    }
    func didTapCell(dateTap: String) {
        
        router.openRate(for: dateTap)
    }
}

extension DateTableViewPresenter: DateTableViewInteractorOutput {
    
    func didRecevie(error: String) {
        //
    }
    
    func didLoad(dates: [String]) {
        
        view?.showDate(date: dates)
    }
}


