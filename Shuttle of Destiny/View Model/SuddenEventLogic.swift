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
    SuddenPointModel(SuddenEventTitles: "Pacar ngajak jalan", SuddenEventDescs: "Ajak jalan gak?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 1, Used: false)
]

var gameplay: SuddenPointModel = events[0]

class Randomizer {
    static func randomizeSuddenDays(for pointModel: PointModel) {
        pointModel.SuddenDays.shuffle()
        if pointModel.SuddenDays.count > 8 {
            pointModel.SuddenDays = Array(pointModel.SuddenDays.prefix(8))
        }
    }
    
    static func randomizeSuddenEvent(for suddenPointModel: [SuddenPointModel], pointModel: PointModel) -> SuddenPointModel {
        var shuffledIds = Array(1...3).shuffled()
        shuffledIds.remove(at: pointModel.ChoiceID-1)
        
        guard let filteredEvent = suddenPointModel.filter ({ event in
            event.id == shuffledIds.first
        }).first else { return events[0] }
        
        return filteredEvent
    }
}



