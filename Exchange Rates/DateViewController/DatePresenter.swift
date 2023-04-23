//
//  DatePresenter.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol DatePresenterProtocol: AnyObject {
    
    //View -> Presenter
    func viewDidLoaded() //загрузился вью контроллер
    func didLoad(dates: [String]?) //загрузились даты
    func didTapCell()
}

class DatePresenter {
    
    weak var view: DateViewProtocol?
    var interactor: DateInteractorProtocol
    var router: DateRouterProtocol

    init(interactor: DateInteractorProtocol, router: DateRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension DatePresenter: DatePresenterProtocol {

    func viewDidLoaded() {
        //метод протокола interactora
        interactor.loadData()
    }
    
    func didLoad(dates: [String]?) {
        
        view?.showDate(date: dates ?? [])
    }
    
    func didTapCell() {
        
        router.openRate()
    }

}
