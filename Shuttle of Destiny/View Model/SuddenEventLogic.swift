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
    SuddenPointModel(SuddenEventTitles: "Bapak kepleset", SuddenEventDescs: "Bapak lu kepleset apa yang anda harus lakukan?", SuddenPointPluses: 1, SuddenPointMinuses: 1, SuddenPointPlusesOther: 1, SuddenPointMinusesOther: 1,SuddenEventType: 3, id: 1 ,Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Pacar ngajak jalan", SuddenEventDescs: "Ajak jalan gak?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 2 ,Used: false),
    
    SuddenPointModel(SuddenEventTitles: "Hans ajak gym", SuddenEventDescs: "Mau ikut ato enggak?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 3, Used: false)
]

var gameplay: SuddenPointModel = events[0]

class Randomizer {
    static func randomizeSuddenDays(for dataItem: PointModel) {
        dataItem.SuddenDays.shuffle()
        if dataItem.SuddenDays.count > 8 {
            dataItem.SuddenDays = Array(dataItem.SuddenDays.prefix(8))
        }
    }
    
    static func randomizeSuddenEvent(for gamePlay: [SuddenPointModel]) -> SuddenPointModel {
        let shuffledIds = Array(1...3).shuffled()
        
        guard let filteredEvent = gamePlay.filter ({ event in
            event.id == shuffledIds.first
        }).first else { return events[0] }
        
        return filteredEvent
    }
}



