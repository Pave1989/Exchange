//
//  DateTableViewCell.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 23.04.2023.
//

import UIKit

class DateTableViewCell: UITableViewCell {

    static let cellID = "StartCell"
    private(set) var dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeUI() {
        
 //MARK: - dateLabel
        dateLabel.textAlignment = .center
        dateLabel.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        dateLabel.layer.masksToBounds = true
        dateLabel.layer.cornerRadius = 15
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 50).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
    }
}
