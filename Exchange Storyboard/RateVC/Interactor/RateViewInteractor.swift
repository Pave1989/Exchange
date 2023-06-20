//
//  RateInteractor.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 18.06.2023.
//

import Foundation

final class RateViewInteractor: RateViewInteractorInput{
    
    weak var output: RateViewInteractorOutput?
    let rateService = RateService()
    var dateVC: String
    
    init(dateVC: String){
        self.dateVC = dateVC
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
                self?.output?.didLoadUSD(usdResult: dollar)
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
                self?.output?.didLoadEUR(eurResult: euro)
            case .failure(let error):
                print(error)
            }
        }
    }
}
