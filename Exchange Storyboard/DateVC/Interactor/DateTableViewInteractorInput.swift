//
//  DateTableViewInteractorInput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

protocol DateTableViewInteractorInput {

    func loadDate()
    func loadMonth(month: Double)
    var monthInteractor: Double { get }
}
