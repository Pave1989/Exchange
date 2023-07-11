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
    private let loadingID = "loadingID"
    private var datesArray: [String] = []
    private var titleDate: String = "Список дат:"

    private let dateService = DateService()
    var monthInt = 0
    var page = -1
    var pageSize = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: DateTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellID)
        tableView.register(UINib(nibName: String(describing: DateHeaderTableViewCell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
        tableView.register(UINib(nibName: String(describing: LoadingTableViewCell.self), bundle: nil), forCellReuseIdentifier: loadingID)
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

        if /*page < pageSize && */indexPath.row == datesArray.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: loadingID) as! LoadingTableViewCell
            cell.loadIndicator.startAnimating()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DateTableViewCell
            let textValue = datesArray[indexPath.row]
            cell.dateLabel.text = "\(textValue)"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dateTap = datesArray[indexPath.row]
        output?.didTapCell(dateTap: dateTap)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if indexPath.row == datesArray.count - 1{

            loadMoreData()
        }

        func loadMoreData(){
// MARK: - надо за просить сервис еще раз

            monthInt = monthInt - 1
            output?.addMonth(month: monthInt)
            tableView.reloadData()
            print("From VC: \(monthInt)")
            print("LoadMoreData...")
            dateService.getData(month: monthInt) { value in
                switch value {
                case.success(let dates):
                    self.datesArray = dates
                    
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
 }

extension DateTableViewController: DateTableViewInput {
    
    func showDate(date: [String]) {

        self.datesArray = date
        print("Dates count = \(self.datesArray.count)")

        self.tableView.reloadData()

    }
    
    func showError(error: String) {
        
        self.titleDate = error
    }
    
 
 }

