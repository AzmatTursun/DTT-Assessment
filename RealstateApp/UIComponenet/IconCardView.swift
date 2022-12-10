//
//  IconCardComponent.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import SwiftUI

struct IconCardView: View {
    var icon: String
    var info: Text
    
    var body: some View {
        HStack(spacing: 5){
            Image(icon)
                .resizable()
                .frame(width: 10, height: 10)
            info
                .font(.system(size: 8))
                .foregroundColor(.gray)
        }
        
    }
}

struct IconCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        IconCardView(icon: Constant.homeSelectedIcon, info: Text("Test"))
    }
}
