//
//  Observer.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import Foundation

protocol Observer: AnyObject {
    func update(result: ResultMessage)
}
