//
//  DateModuleBuilder.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

import UIKit

class DateModuleBuilder {
    
    static func build() -> DateViewController {
        
        let interactor = DateInteractor()
        let router = DateRouter()
        let presenter = DatePresenter(interactor: interactor, router: router)
        let viewController = DateViewController()
        presenter.view  = viewController
        viewController.presenter = presenter
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
