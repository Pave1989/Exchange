//
//  RateInteractorOutput.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

protocol RateViewInteractorOutput: AnyObject {
    
    func didLoadUSD(usdResult: Double)
    func didLoadEUR(eurResult: Double)
}
