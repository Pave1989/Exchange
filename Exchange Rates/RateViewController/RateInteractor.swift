//
//  RateInteractor.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol RateInteractorProtocol: AnyObject {
    //Presenter -> Interactor
}

class RateInteractor: RateInteractorProtocol {
    weak var presenter: RatePresenterProtocol?
    //сильная ссылка на сервис

}
