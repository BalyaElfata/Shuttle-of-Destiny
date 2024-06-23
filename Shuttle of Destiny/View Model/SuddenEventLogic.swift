////
////  SuddenEventLogic.swift
////  sudden_event
////
////  Created by Geraldo Pannanda Lutan on 12/06/24.
////
//
//import Foundation
//import SwiftUI
//import SwiftData
//
//// Assuming DataItem is defined elsewhere in your project
//var pointModels: DataItem = DataItem() // SwiftData Variable
//
//let event = [
//    Gameplay(SuddenEventTitles: ["Sudden Title"], SuddenEventDescs: ["Sudden Event Description"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1],SuddenEventType: 1, id: 0, Used: false)
//]
//
//var gameplay: Gameplay = event[0]
//
//class Randomizer {
//    static func randomizeSuddenDays(for dataItem: DataItem) {
//        dataItem.SuddenDays.shuffle()
//        if dataItem.SuddenDays.count > 8 {
//            dataItem.SuddenDays = Array(dataItem.SuddenDays.prefix(8))
//        }
//    }
//    
//    static func randomizeSuddenEvent(for gamePlay: Gameplay){
//        let shuffledIds = Array(1...10).shuffled()
//        gamePlay.id = shuffledIds.first ?? 1
//        
//        
//    }
//}
//
//
//
