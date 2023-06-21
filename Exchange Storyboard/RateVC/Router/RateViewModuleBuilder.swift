//
//  RateModuleBuilder.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation
import UIKit

class RateModuleBuilder {
    
static func build(dateVC: String) -> UIViewController {
    
    let rateStoriboardID = "Rate"
    let interactor = RateViewInteractor(dateVC: dateVC)
    let router = RateViewRouter()
    let presenter = RateViewPresenter(interactor: interactor, router: router)
    let storyboard = UIStoryboard(name: rateStoriboardID, bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: rateStoriboardID) as! RateViewController
    
    presenter.view = viewController
    interactor.output = presenter
    viewController.output = presenter
    
    return viewController
  }
}
