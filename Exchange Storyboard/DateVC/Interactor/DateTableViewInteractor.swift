//
//  DateTableViewInteractor.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 20.06.2023.
//

import Foundation

final class DateTableViewInteractor:  DateTableViewInteractorInput {

    weak var output: DateTableViewInteractorOutput?
    
    var datesServise = DateService()
    
    func loadDate() {

        datesServise.getData {  [weak self] result in
            switch result {
            case.success(let data):
                self?.output?.didLoad(dates: data)
            case.failure(_):
                let error = "ошибка загрузки дат"
                self?.output?.didRecevie(error: error)
            }
        }
    }
//    func loadPagination() {
//       let pagination = datesServise.isPaginating
//        self.output?.didLoad(pagination: pagination)
//    }
    //    func loadMoreDate() {
    //        datesServise.getData(pagination: true) { [weak self] result in
    //            switch result {
    //            case .success(let moreDates):
    //                self?.output?.didLoad(moreDates: moreDates)
    //            case .failure(_):
    //                break
    //            }
    //        }
    //    }
//    func loadDate() {
//
//        datesServise.getData (pagination: false, complition: {  [weak self] result in
//            switch result {
//            case.success(let data):
//                self?.output?.didLoad(dates: data)
//            case.failure(_):
//                let errorSTR = "ошибка загрузки дат"
//                self?.output?.didRecevie(error: errorSTR)
//            }
//        })
//    }
}
