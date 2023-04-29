//
//  RatePresenter.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol RatePresenterProtocol: AnyObject {
    
    //View -> Presenter
    func viewDidLoaded()
    func didLoadUSD(usd: Double?)
    func didLoadEUR(eur: Double?)
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
    func didLoadUSD(usd: Double?) {
        let money = usd
        view?.showUSD(money: money ?? 0.0)
    }
    
    func didLoadEUR(eur: Double?) {
        let money = eur
        view?.showUSD(money: money ?? 0.0)
    }
    
    
    func viewDidLoaded() {
        let date = interactor.getCurrentDate()
        view?.showDate(date: date ?? "0000-00-00")
    }
}

