//
//  ContentView.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    
                    SearchBarView(searchText: $homeVM.searchText)
                    
                    if houses.isEmpty {
                        VStack (spacing: 20){
                            Image(Constant.emptyListIcon)
                            Text(Constant.noResultText)
                                .multilineTextAlignment(.center)
                        }.padding(.top, 100)
                    }
                    
                    ForEach(houses, id: \.self) { house in
                        CardView(image: URLImageView(urlPath: house.image, width: 100, height: 100), house: house)
                    }
                }
                .padding()
            }
            .navigationTitle("DTT REAL ESTATE")
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }
    }
    
    var houses: [House] {
        
        if homeVM.searchText.isEmpty {
            return homeVM.houses.sorted { firstHouse, secondHouse in
                firstHouse.price < secondHouse.price
            }
        } else {
            return homeVM.houses.filter {
                $0.zip.contains(homeVM.searchText.uppercased()) || $0.city.contains( homeVM.searchText.capitalized)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
