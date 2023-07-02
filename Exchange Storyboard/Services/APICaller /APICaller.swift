//
//  APICaller.swift
//  Exchange Storyboard
//
//  Created by Павел Галкин on 26.06.2023.
//

import Foundation

final class APICaller {
    //Singleton
    static let shared = APICaller()
    private init(){}
    //пустой массив
    public private(set) var models = [String]()
    //метод получения данных
    func fetchData(complition: @escaping([String])->Void) {
        DispatchQueue.global().asyncAfter(deadline: .now()+2) { [weak self] in
            //присваивание массиву диапазон занчений и подставление в стрку
            self?.models = Array(1...20).map { "Book \($0)" }
            //завершение с массивом строк либо пустой массив
            complition(self?.models ?? [])
        }
    }
    func loadMorePosts(complition: @escaping([String])->Void) {
        DispatchQueue.global().asyncAfter(deadline: .now()+2) { [weak self] in
            //отлавливание последнего элемента в колекции либо выход
            guard let strongSelf = self,//для компиляции
                  let last = strongSelf.models.last else { return }
            let number = Int(last.components(separatedBy: "").last!)!
            let start = number + 1
            let end = start + 20
            //мапинг от и до с подставлением значения
            let newData = Array(start...end).map { "Book \($0)" }
            // добавление полученного диапазона в массив
            strongSelf.models.append(contentsOf: newData)
            
            complition(self?.models ?? [])
        }
    }
}
