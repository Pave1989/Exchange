//
//  RatePresenter.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol RatePresenterProtocol: AnyObject {
    //View -> Presenter
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
}
