//
//  Subject.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import Foundation

class Subject {
    private var observers = [Observer]()
    
    func attach(_ observer: Observer) { observers.append(observer) }
    
    func detach(_ observer: Observer) {
        if let idx = observers.firstIndex(where: { $0 === observer }) { observers.remove(at: idx) }
    }
    
    func notify(result: ResultMessage) {
        observers.forEach({$0.update(result: result)})
    }
}
