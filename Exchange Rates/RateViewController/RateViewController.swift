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
    func showUSD(usd: Double)
    func showEUR(eur: Double)
}

class RateViewController: UITableViewController {
    
    var modelUSD: MoneyModel?
//    var usdString: Double
//    var eurString: Double
// MARK: - Public
    var presenter: RatePresenterProtocol?
    var headerLabel: String = ""
    private var moneyArray: [String] = ["Доллар", "Евро"]
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
        header.titleLabel.text = "Курс рубля на дату: \(textValue)"
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return UIConstants.heightForHeaderInSection
    }
//MARK: - CELL
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        moneyArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RateTableViewCell.cellID, for: indexPath) as! RateTableViewCell
        print(rateArray)
//MARK: - подставить сюда занчения!
        let textValue = 80.012
        cell.moneyLabel.text = "\(moneyArray[indexPath.row]) \(textValue)"
        
        return cell
    }
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UIConstants.heightForRowAt
    }
}

extension RateViewController: RateViewProtocol {
    
    func showUSD(usd: Double) {
        print(usd)
//        self.usdString = usd ?? 01.01
        rateArray.append(usd)
//        self.tableView.reloadData()
    }
    
    func showEUR(eur: Double) {
        print(eur)
//        self.eurString = eur ?? 02.02
        rateArray.append(eur)
//        self.tableView.reloadData()
    }

    func showDate(date: String) {
        
        self.headerLabel = date
        self.tableView.reloadData()
    }
}
