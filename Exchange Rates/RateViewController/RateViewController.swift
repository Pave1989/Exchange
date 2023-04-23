//
//  RateViewController.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

import UIKit

protocol RateViewProtocol: AnyObject {
    
    //Presenter -> View
}

class RateViewController: UITableViewController {
    
    // MARK: - Public
    var presenter: RatePresenterProtocol?
    private let backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    private var moneyArray = ["USD", "EUR"]
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        tableView.register(RateTableViewCell.self, forCellReuseIdentifier: RateTableViewCell.cellID)
        tableView.register(RateHeaderCell.self, forHeaderFooterViewReuseIdentifier: RateHeaderCell.headerID)
    }
    //MARK: - HEADER
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: RateHeaderCell.headerID) as! RateHeaderCell
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        80
    }
    //MARK: - CELL
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moneyArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RateTableViewCell.cellID, for: indexPath) as! RateTableViewCell
        let textValue = moneyArray[indexPath.row]
        cell.moneyLabel.text = textValue
        return cell
    }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}

// MARK: - RateViewProtocol
extension RateViewController: RateViewProtocol {
 
    }
