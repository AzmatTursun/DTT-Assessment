//
//  HomeViewModel.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import Foundation

class HomeViewModel: ObservableObject, Observer {
 
    @Published var houses: [House] = []
    
    @Published var searchText: String = Constant.defaultTextValue
    
    init() {
        
        Client.shared.subject.attach(self)
        
        Client.shared.getAllHouses()
    }
    
    func update(result: ResultMessage) {
        if result.messageType == MessageType.GetAllHouses {
            
            if let values = result.message as? [House] { houses = values }
        }
    }
    
}
