import Foundation
import SwiftData

@Model
class Gameplay: Identifiable {
    
    var SuddenEventTitles: [String]
    var SuddenEventDescs: [String]
    var SuddenPointPluses: [Int]
    var SuddenPointMinuses: [Int]
    var SuddenPointPlusesOther: [Int]
    var SuddenPointMinusesOther: [Int]
    var Used: Bool
    
    init(SuddenEventTitles: [String], SuddenEventDescs: [String], SuddenPointPluses: [Int], SuddenPointMinuses: [Int], SuddenPointPlusesOther: [Int], SuddenPointMinusesOther: [Int], Used: Bool) {
        self.SuddenEventTitles = SuddenEventTitles
        self.SuddenEventDescs = SuddenEventDescs
        self.SuddenPointPluses = SuddenPointPluses
        self.SuddenPointMinuses = SuddenPointMinuses
        self.SuddenPointPlusesOther = SuddenPointPlusesOther
        self.SuddenPointMinusesOther = SuddenPointMinusesOther
        self.Used = Used
    }
}