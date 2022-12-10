//
//  CardView.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import SwiftUI
import CoreLocation

struct CardView: View {
    
    var image: URLImageView
    
    var house:House
    
    @State private var showDetails: Bool = false
    
    @State private var distance: String = Constant.defualtDistance
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                
                image
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text("\(Constant.dollarSign) \(house.price)")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                    Text("\(house.zip) \(house.city)")
                    
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    HStack (spacing: 15){
                        IconCardView(icon: Constant.bedIcon, info: Text("\(house.bedrooms)"))
                        IconCardView(icon: Constant.showerIcon, info: Text("\(house.bathrooms)"))
                        IconCardView(icon: Constant.sizeIcon, info: Text("\(house.size)"))
                        IconCardView(icon: Constant.pinIcon, info: Text("\(distance) \(Constant.distanceKM)"))
                    }
                    .layoutPriority(100)
                    .onReceive(LocationManager.shared.$userLocation) { newLocation in
                        if let userLocation = newLocation {
                            let houseLocation = CLLocation(latitude: CLLocationDegrees(house.latitude), longitude: CLLocationDegrees(house.longitude))
                            let temp = round(userLocation.distance(from: houseLocation) / 1000 * 10) / 10.0
                            distance = String(format: "%g", temp)
                        }
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .onTapGesture { showDetails.toggle() }
            .fullScreenCover (isPresented: $showDetails) { HomeDetailSheet(image: URLImageView(urlPath: house.image, width: 400, height: 300), house: house, distance: distance, show: $showDetails)}
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
            )
            .padding([.top, .horizontal])
            
        }
    }
}
