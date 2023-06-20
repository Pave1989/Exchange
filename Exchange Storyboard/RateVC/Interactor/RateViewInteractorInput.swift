//
//  RateInteractorInput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol RateViewInteractorInput: AnyObject {
    
    func convertDateFormat(inputDate: String) -> String
    func loadDollar()
    func loadEuro()
    var dateVC: String { get }
}
