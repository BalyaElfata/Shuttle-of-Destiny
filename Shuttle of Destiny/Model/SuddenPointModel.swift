//
//  SuddenPointModel.swift
//  sudden_event
//
//  Created by Geraldo Pannanda Lutan on 12/06/24.
//

import Foundation
import SwiftData

@Model
class Gameplay: Identifiable {
    
    var SuddenEventTitle: String
    var SuddenEventDesc: String
    var SuddenPointPlus: Int
    var SuddenPointMinus: Int
    var SuddenPointPlusOther: Int
    var SuddenPointMinusOther: Int
    var Used: Bool
    
    init(SuddenEventTitle: String, SuddenEventDesc: String, SuddenPointPlus: Int, SuddenPointMinus: Int, SuddenPointPlusOther: Int, SuddenPointMinusOther: Int, Used: Bool) {
        self.SuddenEventTitle = SuddenEventTitle
        self.SuddenEventDesc = SuddenEventDesc
        self.SuddenPointPlus = SuddenPointPlus
        self.SuddenPointMinus = SuddenPointMinus
        self.SuddenPointPlusOther = SuddenPointPlusOther
        self.SuddenPointMinusOther = SuddenPointMinusOther
        self.Used = Used
    }
}
