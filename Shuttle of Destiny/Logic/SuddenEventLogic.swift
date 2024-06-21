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
var pointModels: DataItem = DataItem() // SwiftData Variable

class Randomizer {
    static func randomizeSuddenDays(for dataItem: DataItem) {
        dataItem.SuddenDays.shuffle()
        if dataItem.SuddenDays.count > 8 {
            dataItem.SuddenDays = Array(dataItem.SuddenDays.prefix(8))
        }
    }
}

