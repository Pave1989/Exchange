//
//  RateTableViewCell.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 23.04.2023.
//

import UIKit

class RateTableViewCell: UITableViewCell {
    
    static let cellID = "MoneyCell"
    private(set) var moneyLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initializeUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeUI() {
        
 //MARK: - moneyLabel
        moneyLabel.textAlignment = .left
        addSubview(moneyLabel)
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        moneyLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        moneyLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        moneyLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
