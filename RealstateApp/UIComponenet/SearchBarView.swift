//
//  SearchBarView.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 10/12/2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack{
            TextField(Constant.searchBarPlaceHolder, text: $searchText)
            
            if searchText.isEmpty {
                Image(Constant.searchIcon)
                    .renderingMode(.template)
                    .foregroundColor(.light)
                    .padding(.trailing)
            } else {
                Image(Constant.closeIcon)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.black)
                    .padding(.trailing)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        searchText = Constant.defaultTextValue
                    }
            }
        }
        .padding(.all, 10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.darkGray)
        )
        .padding(.horizontal, 25)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(Constant.defaultTextValue))
    }
}
