//
//  RateViewController.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

import UIKit

protocol RateViewProtocol: AnyObject {
    
    //Presenter -> View
    func showDate(date: String)
    func showUSD(money: Double)
    func showEUR(money: Double)
}

class RateViewController: UITableViewController {
    
    // MARK: - Public
    var presenter: RatePresenterProtocol?
    var headerLabel: String = ""
    private var moneyArray: [String] = []
    private var rateArray: [Double] = []
    
    private enum UIConstants {
        
        static let colorBackgroundView: UIColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        static let heightForHeaderInSection: CGFloat = 80
        static let heightForRowAt: CGFloat = 40
    }
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
  
            presenter?.viewDidLoaded()

        view.backgroundColor = UIConstants.colorBackgroundView
        tableView.register(RateTableViewCell.self, forCellReuseIdentifier: RateTableViewCell.cellID)
        tableView.register(RateHeaderCell.self, forHeaderFooterViewReuseIdentifier: RateHeaderCell.headerID)
    }
    //MARK: - HEADER
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: RateHeaderCell.headerID) as! RateHeaderCell
        let textValue = headerLabel
        header.titleLabel.text = "Курс на дату: \(textValue)"
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UIConstants.heightForHeaderInSection
    }
    //MARK: - CELL
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        rateArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RateTableViewCell.cellID, for: indexPath) as! RateTableViewCell
        let textValue = rateArray[indexPath.row]
        cell.moneyLabel.text = String(textValue)
        return cell
    }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIConstants.heightForRowAt
    }
}

// MARK: - RateViewProtocol
extension RateViewController: RateViewProtocol {
    func showUSD(money: Double) {
        rateArray.append(money)
    }
    
    func showEUR(money: Double) {
        rateArray.append(money)
    }

    func showDate(date: String) {
        self.headerLabel = date
        self.tableView.reloadData()
    }
}
