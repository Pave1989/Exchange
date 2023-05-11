//
//  RateInteractor.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol RateInteractorProtocol: AnyObject {
    
//Presenter -> Interactor
    func getCurrentDate() -> String
    func loadDollar()
    func loadEuro()
}

class RateInteractor: RateInteractorProtocol {
    
    weak var presenter: RatePresenterProtocol?
    let rateService = RateService()
    var dateVC: String
    
    init(dateVC: String){
        self.dateVC = dateVC //String(dateVC.reversed())
    }
    
    func loadDollar() {
 
        rateService.getUSD(date1: dateVC) {  [weak self] dateUSD in
            
            switch dateUSD {
            case .success(let model):
                guard let dollar = model?.data?.rub?.value else {
                    print(NetworkingError.invalidData)
                    return
                }
                self?.presenter?.didLoadUSD(usdResult: dollar)
//                print(model)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func loadEuro() {
        
        rateService.getEUR(date1: dateVC) { [weak self] dateEUR in
            
            switch dateEUR {
            case .success(let model):
                guard let euro = model?.data?.rub?.value else {
                    print(NetworkingError.invalidData)
                    return
                }
                self?.presenter?.didLoadUSD(usdResult: euro)
//                print(model)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCurrentDate() -> String {
        
        let dateVC = dateVC
        return dateVC
    }
}
