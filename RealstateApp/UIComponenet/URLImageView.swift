//
//  URLImage.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import SwiftUI

struct URLImageView: View {
    let urlPath: String
    let width: CGFloat
    let height: CGFloat
    
    @State var data: Data?
    
    var body: some View {
        
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .frame(width: width, height: height)
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "house")
                .resizable()
                .frame(width: width, height: height)
                .aspectRatio(contentMode: .fit)
                .onAppear{
                    initImageData(imagePath: urlPath)
                }
        }
    }
    
    private func initImageData(imagePath: String) {
        
        guard let url = URL(string: Constant.domainURL + imagePath) else { fatalError(Constant.invalidURLErrorMessage) }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
        guard let returnedData = data, error == nil else { return }
        
        self.data = returnedData
            
        }.resume()
        
    }
}
