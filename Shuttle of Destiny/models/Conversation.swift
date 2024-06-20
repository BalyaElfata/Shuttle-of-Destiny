//
//  Conversation.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 20/06/24.
//

import Foundation
import SwiftData

@Model
class Conversation: Identifiable {
    
    var conversationMessage: String
    var actor: String
    var implementType: String // "Prologue", "Sudden Event", "Ending"
    var suddenEventType: String // "F1", "L1", "C1", "F2", ...
    var endingType: Int // "1", "2", "3"
    var runningNumber : Int // each different possibility should start from 1
    
    init(conversationMessage: String, actor: String, implementType: String, suddenEventType: String, endingType: Int, runningNumber: Int) {
        self.conversationMessage = conversationMessage
        self.actor = actor
        self.implementType = implementType
        self.suddenEventType = suddenEventType
        self.endingType = endingType
        self.runningNumber = runningNumber
    }
}

