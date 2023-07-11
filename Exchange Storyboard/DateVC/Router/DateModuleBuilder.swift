//
//  DateModuleBuilder.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation
import UIKit

class DateModuleBuilder {
    
    static func build() -> UIViewController {
        
    let dateStoriboardID = "Date"
    let interactor = DateTableViewInteractor(monthInt: -1)
    let router = DateTableViewRouter()
    let presenter = DateTableViewPresenter(interactor: interactor, router: router)
    let storuboard = UIStoryboard(name: dateStoriboardID, bundle: nil)
        let viewController = storuboard.instantiateViewController(withIdentifier: dateStoriboardID) as! DateTableViewController
    
    presenter.view = viewController
    interactor.output = presenter
    viewController.output = presenter
    router.viewController = viewController
    interactor.datesServise = DateService()
            
    return viewController
 }
}
