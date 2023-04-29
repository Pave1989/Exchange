//
//  RateInteractor.swift
//  Super easy dev
//
//  Created by Павел Галкин on 14.04.2023
//

protocol RateInteractorProtocol: AnyObject {
    
    //Presenter -> Interactor
    func getCurrentDate() -> String?
    func loadRate()
    var modelEUR: MoneyModel? { get set }
    var modelUSD: MoneyModel? { get set }
}

class RateInteractor: RateInteractorProtocol {
    weak var presenter: RatePresenterProtocol?
    let rateService = RateService()
    var date: String
    var modelEUR: MoneyModel?
    var modelUSD: MoneyModel?
    var rateUSD: Double = 0.0
    var rateEUR: Double = 0.0
    
    init(date: String){
        self.date = date
    }
    //сюда залетают модели надо распарсить здесь их
    //желательно передать модели
    func loadRate() {
        rateService.getUSD(date: date) {  dateUSD in
            switch dateUSD {
            case .success(let model):
                self.modelUSD = model
                self.rateUSD = model!.rates.RUB
            case .failure(let fail):
                print(fail)
            }
            self.presenter?.didLoadUSD(usd: self.rateUSD)
        }
        rateService.getEUR(date: date) {  dateEUR in
            switch dateEUR {
            case .success(let model):
                self.modelUSD = model
                self.rateUSD = model!.rates.RUB
            case .failure(let fail):
                print(fail)
            }
            self.presenter?.didLoadUSD(usd: self.rateUSD)
            self.presenter?.didLoadEUR(eur: self.rateEUR)
        }
    }
    
    func getCurrentDate() -> String? {
        return date
    }
}
