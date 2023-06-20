//
//  DateTableViewRouter.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

final class DateTableViewRouter: DateTableViewRouterInput {
 
    weak var viewController: DateTableViewController?
    
    func openRate(for dateVC: String) {

        let vc = RateModuleBuilder.build(dateVC: dateVC)
        viewController?.present(vc, animated: true, completion: nil)
    }
}
