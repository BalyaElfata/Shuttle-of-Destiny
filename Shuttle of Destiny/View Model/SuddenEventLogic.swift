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
    SuddenPointModel(SuddenEventTitles: ["Sudden Title"], SuddenEventDescs: ["Sudden Event Description"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1],SuddenEventType: 1, id: 0, Used: false)
]

var gameplay: SuddenPointModel = event[0]

class Randomizer {
    static func randomizeSuddenDays(for dataItem: PointModel) {
        dataItem.SuddenDays.shuffle()
        if dataItem.SuddenDays.count > 8 {
            dataItem.SuddenDays = Array(dataItem.SuddenDays.prefix(8))
        }
    }
    
    static func randomizeSuddenEvent(for gamePlay: [SuddenPointModel]) -> SuddenPointModel {
        let shuffledIds = Array(1...10).shuffled()
        
        guard let filteredEvent = gamePlay.filter ({ event in
            event.id == shuffledIds.first
        }).first else { return events[0] }
        
        return filteredEvent
    }
}



