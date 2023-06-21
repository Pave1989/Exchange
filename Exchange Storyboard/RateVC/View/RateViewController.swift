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
           
            self.dollarValueLabel.text = String(usd)
    }
    
    func showEUR(eur: Double) {
        
            self.euroValueLabel.text = String(eur)
    }
    
    func showError(error: String) {
                
            self.dollarValueLabel.text = error
            self.euroValueLabel.text = error
    }
 
}
