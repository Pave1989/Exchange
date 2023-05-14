//
//  RatePresenter.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol RatePresenterProtocol: AnyObject {
    
    //View -> Presenter
    func viewDidLoaded()
    func didLoadUSD(usdResult: Double)
    func didLoadEUR(eurResult: Double)
}

class RatePresenter {
    
    weak var view: RateViewProtocol?
    var router: RateRouterProtocol
    var interactor: RateInteractorProtocol

    init(interactor: RateInteractorProtocol, router: RateRouterProtocol) {
        
        self.interactor = interactor
        self.router = router
    }
}

extension RatePresenter: RatePresenterProtocol {
    
    func didLoadUSD(usdResult: Double) {
        
        view?.showUSD(usd: usdResult)
    }
    
    func didLoadEUR(eurResult: Double) {
        
        view?.showEUR(eur: eurResult)
    }
 
    func viewDidLoaded() {
        
        interactor.loadEuro()
        interactor.loadDollar()
        let date = interactor.dateVC
        view?.showDate(date: date)
    }
}

