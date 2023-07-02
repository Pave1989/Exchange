//
//  DateTableViewController.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 17.06.2023.
//
import UIKit

final class DateTableViewController: UITableViewController {
    
//    var datesServise = DateService()
    var output: DateTableViewOutput?
    private let cellID = "cellID"
    private let headerID = "headerID"
    private let loadingID = "loadingID"

    private var limit = 20
    private var totalDates = 0
    private var index = 0
    private var displayDates: [String] = []
    
    private var datesArray: [String] = []
    private var titleDate: String = "Список дат:"
//    private var fetchingMore = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: DateTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellID)
        tableView.register(UINib(nibName: String(describing: DateHeaderTableViewCell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: headerID)
//        tableView.register(UINib(nibName: String(describing: LoaidngTableViewCell.self), bundle: nil), forHeaderFooterViewReuseIdentifier: loadingID)
        totalDates = datesArray.count
        while index < limit {
            displayDates.append(datesArray[index])
            index = index + 1
        }
        
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as! DateHeaderTableViewCell
        
        header.dateTitleLabel.text = titleDate
        
        return header
    }
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        if section == 0 {
            return datesArray.count
//        } else if section == 1 /* && fetchingMore */ {
//            return 1
//        }
//        return 0
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row == datesArray.count - 1  {
//            let cell = tableView.dequeueReusableCell(withIdentifier: loadingID, for: indexPath) as! LoaidngTableViewCell
//                cell.loadSpinner.startAnimating()
//            return cell
//        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DateTableViewCell
            let textValue = datesArray[indexPath.row]
            cell.dateLabel.text = "\(textValue)"
            return cell
//        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dateTap = datesArray[indexPath.row]
        output?.didTapCell(dateTap: dateTap)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == displayDates.count - 1 {
            loadMoreData()
        }
        func loadMoreData(){
            print("LoadMoreData.........")
            var index = displayDates.count - 1
            if index + 20 > datesArray.count - 1 {
                limit = datesArray.count - index
            }else{
                limit = index + 20
            }
            while index < limit {
                displayDates.append(datesArray[index])
                index = index + 1
            }
            self.perform(#selector(loadTable),with: nil,afterDelay: 0.5)
        }
    }
    @objc func loadTable(){
        self.tableView.reloadData()
    }
//    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        activityIndicator.startAnimating()
//    }
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: loadingID) as! LoaidngTableViewCell
//
//        return footer
//    }
//
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        // Точка, в которой начало представления содержимого смещено от начала представления прокрутки.ось У (равно гдето 2 экрана)
//        let offsetY = scrollView.contentOffset.y
//        //Размер представления содержимого.высота
//        let contentHeight = scrollView.contentSize.height
//        //Прямоугольник кадра, который описывает положение и размер вида в системе координат супервида.высота
//        let scrollViewFrameHeight = scrollView.frame.height
//
//        let heightHeder = tableView.tableHeaderView
//
//        if offsetY > contentHeight - scrollViewFrameHeight    {
////            //добавить переменную из сервиса
////            guard !datesServise.isPaginating else {
////                return
////            }
//////            self.tableView.tableFooterView = createSpinerFooter()
////            print("fetch loading...")
////            //прокинуть еще один массив из сервиса
//////            self.datesArray.append(contentsOf: moreDatesArray)
//////            DispatchQueue.main.async {
//////                self.tableView.reloadData()
//////            }
//////MARK: - TASK: сделать тормоз по окончанию второго массива который прибавляется
////            datesServise.getData(pagination: true) { [weak self]
//////                DispatchQueue.main.async{
//////                    self.tableView.tableFooterView = nil
//////                }
////                result in
////                switch result {
////                case.success(let moreData):
////                    self?.datesArray.append(contentsOf: moreData)
////                    DispatchQueue.main.async {
////                        self?.tableView.reloadData()
////                    }
////                case.failure(_):
////                    break
////                }
////            }
//            if !fetchingMore {
//
//                beginBatchFetch()
//            }
//        }
//    }
//    //MARK: - Один отдает, в себе хранит пагинацию, если апиха отдает постранично, либо индекс последнего элемента, если отдает с определенной точки
//    func beginBatchFetch() {
//        fetchingMore = true
//        print("Fetch working!!!")
////        service.fetchData { [weak self] _ in
////            DispatchQueue.main.async {
////                self?.tableView.reloadData()
////            }
////        }
//        tableView.reloadSections(IndexSet(integer: 1), with: .none)
////        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
////            let newItems = (self.datesArray.count...self.datesArray.count + 12).map { index in index }
//            let newItems = ["01 января 2024","02 января 2024","03 января 2024"]
//            self.datesArray.append(contentsOf: newItems)
//            self.fetchingMore = false
//            self.tableView.reloadData()
////        })
//    }
 }

extension DateTableViewController: DateTableViewInput {
    
    func showError(error: String) {
        
        self.titleDate = error
    }
    
    func showDate(date: [String]) {

        self.datesArray = date
      
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
 }

