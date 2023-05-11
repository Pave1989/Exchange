//
//  DateRouter.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol DateRouterProtocol: AnyObject {
    
    func openRate(for dateVC: String)
}

class DateRouter: DateRouterProtocol {
    
    weak var viewController: DateViewController?
    
    func openRate(for dateVC: String) {
        
        let vc = RateModuleBuilder.build(dateVC: dateVC)
        
        viewController?.present(vc, animated: true, completion: nil)
    }
}
