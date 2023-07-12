//
//  ConvertDateFormatService.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 21.06.2023.
//

import Foundation

class ConvertDateFormatService: ConvertDateFormatServiceProtocol {
    
    func convertDateFormat(inputDate: String) -> String {
        
        let olDateFormatter = DateFormatter()
        olDateFormatter.dateFormat = "dd MMMM yyyy"
        
        let oldDate = olDateFormatter.date(from: inputDate)
        
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = convertDateFormatter.string(from: oldDate!)
        
        return newDate
    }
}
