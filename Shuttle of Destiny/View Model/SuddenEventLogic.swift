//
//  SuddenEventLogic.swift
//  sudden_event
//
//  Created by Geraldo Pannanda Lutan on 12/06/24.
//

import Foundation
import SwiftUI
import SwiftData

// Assuming DataItem is defined elsewhere in your project
var pointModels: PointModel = PointModel() // SwiftData Variable

let events = [
    // relationship
    SuddenPointModel(SuddenEventTitles: "Mia needed you in her house for chit-chat.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 2, SuddenPointMinuses: 3, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 1, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Alex realized that he forgot to bring back Mia's phone.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 5, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 3,SuddenEventType: 1, id: 1, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Mia's father called you for F1 racing match in circuit for couple approval.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 6, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 5,SuddenEventType: 1, id: 1, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Mia asked you to give his allowance per day for wedding proposal.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 7, SuddenPointMinuses: 7, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 7,SuddenEventType: 1, id: 1, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Mia asked you to join window shopping for find a familymaking book.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 8, SuddenPointMinuses: 9, SuddenPointPlusesOther: 6, SuddenPointMinusesOther: 8,SuddenEventType: 1, id: 1, Used: false),
    
    // career
    
    SuddenPointModel(SuddenEventTitles: "A social media post gone viral shown Alex training. He wanted to give appreciation to it.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 3, SuddenPointMinuses: 4, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 2, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Coach has been sick for days, but you're needed by him to go on an international tournament.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 4, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 3, SuddenEventType: 2, id: 2, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "You're meeting Taufik Hendrawan, an former world badminton player, during an tournament.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 6, SuddenPointPlusesOther: 4, SuddenPointMinusesOther: 3, SuddenEventType: 2, id: 2, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Your usual racket has been broken, but Coach fully funded you to buy the legendary racket, Yonax No. 1.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 7, SuddenPointMinuses: 5, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 4, SuddenEventType: 2, id: 2, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Marcus has challenged you in an official exhibition match that is shown on national TV & social media.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 9, SuddenPointMinuses: 10, SuddenPointPlusesOther: 7, SuddenPointMinusesOther: 7, SuddenEventType: 2, id: 2, Used: false),
    
    // family
    SuddenPointModel(SuddenEventTitles: "Dad has been slipped in the emergency ladder.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 3, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 3,SuddenEventType: 3, id: 3, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Smile! Your dad has been asked a video call, but you're in Madrid for a tournament.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 3, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 2,SuddenEventType: 3, id: 3, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Oh no! Your dad wanted you to move him into VIP room.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 3, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 4,SuddenEventType: 3, id: 3, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "A naggy journalist search your dad in hospital for interview, and you're asked to caught him.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 8, SuddenPointMinuses: 7, SuddenPointPlusesOther: 9, SuddenPointMinusesOther: 7,SuddenEventType: 3, id: 3, Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Science is fun~ Vaccine for your dad's disease has been found.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 11, SuddenPointMinuses: 8, SuddenPointPlusesOther: 6, SuddenPointMinusesOther: 5,SuddenEventType: 3, id: 3, Used: false)
]

var gameplay: SuddenPointModel = events[0]

class Randomizer {
    static func randomizeSuddenDays(for pointModel: PointModel) {
        pointModel.SuddenDays.shuffle()
        if pointModel.SuddenDays.count > 8 {
            pointModel.SuddenDays = Array(pointModel.SuddenDays.prefix(8))
        }
    }
    
    static func randomizeSuddenEvent(for suddenPointModel: [SuddenPointModel]) -> SuddenPointModel {
        let shuffledIds = Array(1...3).shuffled()
        
        guard let filteredEvent = suddenPointModel.filter ({ event in
            event.id == shuffledIds.first
        }).first else { return events[0] }
        
        return filteredEvent
    }
}



