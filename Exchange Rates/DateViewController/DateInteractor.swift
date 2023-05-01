//
//  DateInteractor.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

import Foundation

protocol DateInteractorProtocol: AnyObject {
    
    //Presenter -> Interactor
    func loadDate()
    func loadDate1(date: String)
    var date: String { get }
}

class DateInteractor: DateInteractorProtocol {
    
    weak var presenter: DatePresenterProtocol?
    //сильная ссылка на сервис
    let datesServise = DateService()
    var date: String = ""
    
//    init(date: String){
//        self.date = date
//    }
    //здесь разобраться
    func loadDate1(date: String) {
        self.date = date
    }
    
    func loadDate() {
        
        datesServise.getData { [weak self] date in
            self?.presenter?.didLoad(dates: date)
        }
  }
}
