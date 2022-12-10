//
//  House.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import Foundation

struct House: Hashable, Codable {
    let id: Int
    let image: String
    let price: Int
    let bedrooms: Int
    let bathrooms: Int
    let size: Int
    let description: String
    let zip: String
    let city: String
    let latitude: Int
    let longitude: Int
    let createdDate: String
    
    init(id: Int, image: String, price: Int, bedrooms: Int, bathrooms: Int, size: Int, description: String, zip: String, city: String, latitude: Int, longitude: Int, createdDate: String) {
        self.id = id
        self.image = image
        self.price = price
        self.bedrooms = bedrooms
        self.bathrooms = bathrooms
        self.size = size
        self.description = description
        self.zip = zip
        self.city = city
        self.latitude = latitude
        self.longitude = longitude
        self.createdDate = createdDate
    }
}
