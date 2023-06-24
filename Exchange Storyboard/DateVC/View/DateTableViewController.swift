//
//  DateTableViewController.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//

import UIKit

final class DateTableViewController: UITableViewController {
    
    var output: DateTableViewOutput?
    private let cellID = "cellID"
    private let headerID = "headerID"
    private var datesArray: [String] = []
    private var titleDate: String = "Список дат:"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: DateTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellID)
        tableView.register(UINib(nibName: String(describing: DateHeaderTableViewCell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! DateHeaderTableViewCell
        
        header.dateTitleLabel.text = titleDate
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return datesArray.count
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DateTableViewCell
        
        let textValue = datesArray[indexPath.row]
        cell.dateLabel.text = textValue
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dateTap = datesArray[indexPath.row]
        output?.didTapCell(dateTap: dateTap)
    }
}

extension DateTableViewController: DateTableViewInput {
    
    func showError(error: String) {
        
        self.titleDate = error
    }
    
    func showDate(date: [String]) {

            self.datesArray = date
        }
    }

