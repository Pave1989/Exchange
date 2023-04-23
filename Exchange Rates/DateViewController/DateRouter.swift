//
//  DateRouter.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol DateRouterProtocol {
    
    func openRate()
}

class DateRouter: DateRouterProtocol {
    
    weak var viewController: DateViewController?
    
    func openRate() {
        
        let vc = RateModuleBuilder.build()
        
        viewController?.present(vc, animated: true, completion: nil)
    }
}
