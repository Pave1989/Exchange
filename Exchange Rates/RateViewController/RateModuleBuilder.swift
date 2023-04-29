//
//  RateModuleBuilder.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

import UIKit

class RateModuleBuilder {
    static func build(date: String) -> RateViewController {
        let interactor = RateInteractor(date: date)
        let router = RateRouter()
        let presenter = RatePresenter(interactor: interactor, router: router)
        let viewController = RateViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
