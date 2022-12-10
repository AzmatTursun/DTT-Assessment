//
//  InfoView.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 30){
                Text(Constant.randomText)
                    .fontWeight(.light)
                    .font(.system(size: 13))
                    .padding(.leading)
                
                Text(Constant.designText)
                    .fontWeight(.bold)
                    .padding(.leading)
                
                HStack(spacing: 20){
                    Image(Constant.logo)
                        .resizable()
                        .frame(width: 150, height: 50)
                    
                    VStack{
                        Text("by DTT")
                            .fontWeight(.medium)
                        
                        if let url = URL(string: Constant.domainURL) {
                            Link("d-tt.nl", destination: url)
                        }
                        
                    }
                        
                }.padding(.leading)
                    
            
                
                Spacer()
            }
            .navigationTitle("About")
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
