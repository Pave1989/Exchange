//
//  DateTableViewOutput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//

import Foundation

protocol DateTableViewOutput {
    
    func viewDidLoad()
    // Прокидывается дата в выбранной ячейке
    func didTapCell(dateTap: String)
    // Прокидывается значение колличества необходимых ячеек
    func addMonth(month: Double)
}
