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
    private let backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
    private var dateData: [String] = [] //локальное свойство - пустой масссив типа string
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoaded()
        view.backgroundColor = backgroundColor
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
            return 80
        }
    //MARK: - CELL
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            dateData.count //число элементов в массиве
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DateTableViewCell.cellID, for: indexPath) as! DateTableViewCell
            let textValue = dateData[indexPath.row] //конкретный элемент из массива соответствующий строке
            cell.dateLabel.text = textValue
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            presenter?.didTapCell()
        }
        
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 40
        }
}
extension DateViewController: DateViewProtocol {
    
    func showDate(date: [String]) {
        self.dateData = date
        self.tableView.reloadData()
    }
}
