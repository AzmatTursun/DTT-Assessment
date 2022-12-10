//
//  Extentions.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 10/12/2022.
//

import UIKit
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension Color {
    static let lightGray = Color("lightGray")
    static let darkGray = Color("darkGray")
    static let medium = Color("medium")
    static let light = Color("light")
}

