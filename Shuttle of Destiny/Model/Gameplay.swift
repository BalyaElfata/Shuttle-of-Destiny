//
//  Gameplay.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 19/06/24.
//

import Foundation
import SwiftData

@Model
class Gameplay: Identifiable {
    
    var playerName: String
    var dayLapsed: Int
    var lovePts: Int
    var skillPts: Int
    var familyPts: Int
    var suddenEventsPool : [Int]
    var endingGet: Int
    
    init(playerName: String, dayLapsed: Int, lovePts: Int, skillPts: Int, familyPts: Int, suddenEventsPool: [Int], endingGet: Int) {
        self.playerName = playerName
        self.dayLapsed = dayLapsed
        self.lovePts = lovePts
        self.skillPts = skillPts
        self.familyPts = familyPts
        self.suddenEventsPool = suddenEventsPool
        self.endingGet = endingGet
    }
    
}
