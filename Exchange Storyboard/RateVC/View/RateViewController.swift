//
//  RateViewController.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import UIKit

final class RateViewController: UIViewController {
   
    var output: RateViewOutput?
    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var dollarValueLabel: UILabel!
    @IBOutlet weak var euroValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewDidLoad()
  }
}
extension RateViewController: RateViewInput {
    
    func showDate(date: String) {

            self.dateTitleLabel.text = date
    }
    
    func showUSD(usd: Double) {
        DispatchQueue.main.async {
            self.dollarValueLabel.text = String(usd)
        }            
    }
    
    func showEUR(eur: Double) {
        DispatchQueue.main.async {
            self.euroValueLabel.text = String(eur)
        }     
    }
    
    func showError(error: String) {
                
            self.dollarValueLabel.text = error
            self.euroValueLabel.text = error
    }
 
}
