//
//  RateInteractorInput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol RateViewInteractorInput: AnyObject {
    
    func loadDollar()
    func loadEuro()
    
    // Дата которая пришла из DateTableViewController
    var dateVC: String { get }
}
