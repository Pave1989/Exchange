//
//  DateHeaderCell.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 23.04.2023.
//

import UIKit

class DateHeaderCell: UITableViewHeaderFooterView {
    
    static let headerID = "StartHeaderCell"
    private(set) var titleLabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeUI() {
        
        titleLabel.textAlignment = .left
        titleLabel.text = "Список дат:"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
