//
//  RateViewInput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol RateViewInput: AnyObject {
    
    func showDate(date: String)
    func showUSD(usd: Double)
    func showEUR(eur: Double)
}
