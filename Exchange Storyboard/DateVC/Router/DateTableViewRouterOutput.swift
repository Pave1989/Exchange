//
//  DateTableViewRouterInput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

protocol DateTableViewRouterOutput {
    
    // Открытие RateViewController с выбранной датой
    func openRate(for dateVC: String)
}
