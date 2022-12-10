//
//  ResultMessage.swift
//  RealstateApp
//
//  Created by Azmat Tursun on 09/12/2022.
//

import Foundation

class ResultMessage {
    var messageType: MessageType
    var message: AnyObject?
    
    init(messageType: MessageType, message: AnyObject? = nil) {
        self.messageType = messageType
        self.message = message
    }
}
