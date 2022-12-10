//
//  HomeDetailSheet.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import SwiftUI
import MapKit

struct HomeDetailSheet: View {
    
    var image:URLImageView
    
    var house: House
    
    var distance: String
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack{
            
            image
                .padding(.bottom, 500)
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    Image(Constant.arrowLeftIcon)
                        .onTapGesture { show = false }
                        .padding(.leading, 30)
                        .padding(.top, 30)
                    
                    Spacer()
                }
                
                ZStack{
                    Color.white
                    
                    VStack(alignment: .leading){
                        
                        HStack (alignment: .center) {
                            Text("\(Constant.dollarSign) \(house.price)")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(Color.black)
                            
                            HStack{
                                IconCardView(icon: Constant.bedIcon, info: Text("\(house.bedrooms)"))
                                IconCardView(icon: Constant.showerIcon, info: Text("\(house.bathrooms)"))
                                IconCardView(icon: Constant.sizeIcon, info: Text("\(house.size)"))
                                IconCardView(icon: Constant.pinIcon, info: Text("\(distance) \(Constant.distanceKM)"))

                            }
                            .padding(.leading, 100)
                            .padding(.trailing)
                            .fixedSize()
                            
                        }
                        .padding(.top)
                        .padding(.leading)
                        
                        Text("Description")
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .padding(.leading)
                            .padding(.bottom, 10)
                        
                        Text(house.description)
                            .fontWeight(.light)
                            .font(.system(size: 12))
                            .padding(.leading)
                            .padding(.bottom, 10)
                        
                        Text("Location")
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .padding(.leading)
                        
                        MapView(latitude: Double(house.latitude), longitude: Double(house.longitude))
                        
                    }
                }
                .cornerRadius(18)
                .padding(.top, 90)
                
                Spacer()
                
            }
           
        }
    }
    
    private func getRegion(lati: Double, long: Double) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lati, longitude: long), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
}

struct HomeDetailSheet_Previews: PreviewProvider {
    static var previews: some View {
        HomeDetailSheet(image:URLImageView(urlPath: "/uploads/house1.jpg", width: .infinity, height: 300), house: House(id: 0, image: "", price: 2400, bedrooms: 5, bathrooms: 5, size: 5, description: Constant.randomText, zip: "dedede", city: "dede", latitude: 1, longitude: 1, createdDate: "2020"), distance: "54.6", show: .constant(true))
    }
}
