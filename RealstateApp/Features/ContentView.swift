//
//  ContentView.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView (selection: $selection){
            HomeView()
                .tabItem {
                    Image(selection == 0 ? Constant.homeSelectedIcon : Constant.homeUnselectedIcon)
                        .frame(maxWidth: .infinity)
                }
                .tag(0)
            
            InfoView()
                .tabItem {
                    Image(selection == 1 ? Constant.infoSelectedIcon : Constant.infoUnSelectedIcon)
                        .frame(maxWidth: .infinity)
                }
                .tag(1)
        }.onAppear{
            LocationManager.shared.checkIfLocationServicesIsEnabled()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
