//
//  DateInteractor.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol DateInteractorProtocol: AnyObject {
    
    //Presenter -> Interactor
    func loadData()

}

class DateInteractor: DateInteractorProtocol {
    
    weak var presenter: DatePresenterProtocol?
    //сильная ссылка на сервис
    let datesServise = DateService()
    
    func loadData() {

        datesServise.getData { [weak self] date in
            self?.presenter?.didLoad(dates: date)
        }
  }
}
