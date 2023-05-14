//
//  RateInteractor.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

import Foundation

protocol RateInteractorProtocol: AnyObject {
    
//Presenter -> Interactor
    func loadDollar()
    func loadEuro()
    var dateVC: String { get }
}

class RateInteractor: RateInteractorProtocol {
    
    weak var presenter: RatePresenterProtocol?
    let rateService = RateService()
    var dateVC: String
    
    init(dateVC: String){
        self.dateVC = dateVC //String(dateVC.reversed())
    }
//MARK: - преобразование даты в нужный формат для API
    func convertDateFormat(inputDate: String) -> String {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = "dd MMMM yyyy"

         let oldDate = olDateFormatter.date(from: inputDate)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "yyyy-MM-dd"
         let newDate = convertDateFormatter.string(from: oldDate!)
        
        return newDate
    }
//MARK: - получение доллара
    func loadDollar() {
        let convertDate = convertDateFormat(inputDate: dateVC)
        rateService.getUSD(date1: convertDate) {  [weak self] dateUSD in
            
            switch dateUSD {
            case .success(let model):
                guard let dollar = model?.data?.rub?.value else {
                    print(NetworkingError.invalidData)
                    return
                }
                self?.presenter?.didLoadUSD(usdResult: dollar)
            case .failure(let error):
                print(error)
            }
        }
    }
//MARK: - получение евро
    func loadEuro() {
        let convertDate = convertDateFormat(inputDate: dateVC)
        rateService.getEUR(date1: convertDate) { [weak self] dateEUR in
            
            switch dateEUR {
            case .success(let model):
                guard let euro = model?.data?.rub?.value else {
                    print(NetworkingError.invalidData)
                    return
                }
                self?.presenter?.didLoadUSD(usdResult: euro)
            case .failure(let error):
                print(error)
            }
        }
    }
}
