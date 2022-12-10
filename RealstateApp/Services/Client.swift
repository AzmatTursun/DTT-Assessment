//
//  Client.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import Foundation

//This enum can be extended in the future for more message type
//e.g. buy house, add house, change house etc..
enum MessageType {
case GetAllHouses
}


class Client {
    
    private var houses:[House] = []
    
    static let shared = Client()
    
    var subject = Subject()
    
    init() { }

    func getAllHouses() {
        
        URLSession.shared.dataTask(with: getUrlRequest(url: Constant.houseURL)) { [weak self] data, _, error in
            
            guard let data = data, error == nil else { return  }
            
            do {
                
                let decodedHouses = try JSONDecoder().decode([House].self, from: data)
                
                DispatchQueue.main.async {
                    
                    let result = ResultMessage(messageType: MessageType.GetAllHouses, message: decodedHouses as AnyObject)
                    
                    self?.subject.notify(result: result)
                }
                
            } catch let error {
                //TODO: Replace print statement with an error dialog
                print(error)
            }
            
        }.resume()
    }

    
    private func getUrlRequest(url: String) -> URLRequest{
        guard let url = URL(string: url) else { fatalError(Constant.invalidURLErrorMessage) }
        
        var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.setValue(Constant.accessKey, forHTTPHeaderField: "Access-Key")
        
        return urlRequest
    }
    
}
