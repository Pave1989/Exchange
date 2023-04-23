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
        
        backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeUI() {
        
 //MARK: - dateLabel
        dateLabel.textAlignment = .center
        addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
