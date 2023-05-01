//
//  DateViewController.swift
//  Exchange Rates
//
//  Created by Павел Галкин on 19.04.2023.
//

import UIKit

protocol DateViewProtocol: AnyObject {
    //Presenter -> View
    func showDate(date:[String])
}

class DateViewController: UITableViewController {
    
    var presenter: DatePresenterProtocol?
    private var dateData: [String] = []
    
    private enum UIConstants {
        
        static let colorBackgroundView: UIColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        static let heightForHeaderInSection: CGFloat = 80
        static let heightForRowAt: CGFloat = 40
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        presenter?.viewDidLoaded()
        view.backgroundColor = UIConstants.colorBackgroundView
        tableView.register(DateTableViewCell.self, forCellReuseIdentifier: DateTableViewCell.cellID)
        tableView.register(DateHeaderCell.self, forHeaderFooterViewReuseIdentifier: DateHeaderCell.headerID)
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    //MARK: - HEADER
        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DateHeaderCell.headerID) as! DateHeaderCell
            return header
        }
        
        override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return UIConstants.heightForHeaderInSection
        }
    //MARK: - CELL
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            dateData.count //число элементов в массиве
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.cellID, for: indexPath) as! DateTableViewCell
            let textValue = dateData[indexPath.row] 
            cell.dateLabel.text = textValue
            return cell
        }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let date1 = dateData[indexPath.row]
        presenter?.didTapCell(date1: date1)
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            return UIConstants.heightForRowAt
        }
}

extension DateViewController: DateViewProtocol {
    
    func showDate(date: [String]) {
        self.dateData = date
        self.tableView.reloadData()
    }
}
