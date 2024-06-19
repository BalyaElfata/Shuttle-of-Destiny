//
//  File.swift
//  sudden_event
//
//  Created by Geraldo Pannanda Lutan on 12/06/24.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    
    var RelationPoint: Int
    var FamilyPoint: Int
    var TrainingPoint: Int
    var Days: Int
    
    init(RelationPoint: Int = 2, FamilyPoint: Int = 2, TrainingPoint: Int = 2, Days: Int = 1) {
        
        self.RelationPoint = RelationPoint
        self.FamilyPoint = FamilyPoint
        self.TrainingPoint = TrainingPoint
        self.Days = Days
        
    }
}



//class PointModels: ObservableObject {
//    @Published var RelationPoint: Int = 2
//    @Published var FamilyPoint: Int = 2
//    @Published var TrainingPoint: Int = 2
//    @Published var Days: Int = 1
//    
//    // Add a default initializer
//    init() {}
//}

