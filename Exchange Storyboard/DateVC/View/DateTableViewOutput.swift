//
//  DateTableViewOutput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//

import Foundation

protocol DateTableViewOutput {
    
    func viewDidLoad()
    func didTapCell(dateTap: String)
}
