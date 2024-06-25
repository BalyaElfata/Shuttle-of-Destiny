import Foundation
import SwiftData

@Model
class SuddenPointModel: Identifiable {
    
    var SuddenEventTitles: String
    var SuddenEventDescs: String
    var SuddenPointPluses: Int
    var SuddenPointMinuses: Int
    var SuddenPointPlusesOther: Int
    var SuddenPointMinusesOther: Int
    var SuddenEventType: Int
    var id: Int
    var Used: Bool
    
    init(SuddenEventTitles: String = "Ketemu Mia", SuddenEventDescs:String = "Mia ngajak ngedate di taman", SuddenPointPluses:Int = 3, SuddenPointMinuses:Int = 3, SuddenPointPlusesOther:Int = 3, SuddenPointMinusesOther:Int = 3, SuddenEventType: Int = 0, id: Int = 0, Used: Bool = false) {
        self.SuddenEventTitles = SuddenEventTitles
        self.SuddenEventDescs = SuddenEventDescs
        self.SuddenPointPluses = SuddenPointPluses
        self.SuddenPointMinuses = SuddenPointMinuses
        self.SuddenPointPlusesOther = SuddenPointPlusesOther
        self.SuddenPointMinusesOther = SuddenPointMinusesOther
        self.SuddenEventType = SuddenEventType
        self.id = id
        self.Used = Used
    }
}
