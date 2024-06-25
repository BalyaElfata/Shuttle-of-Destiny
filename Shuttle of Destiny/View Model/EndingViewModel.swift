//
//  EndingViewModel.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 25/06/24.
//

import Foundation
import SwiftUI
import SwiftData

class EndingViewModel {
    static func calculateEndingTypes(for dataItem: PointModel) {
        if pointModels.FamilyPoint > 12 || pointModels.RelationPoint > 12 || pointModels.TrainingPoint > 12 {
            pointModels.EndingGet = 1
        } else if pointModels.FamilyPoint < 0 || pointModels.RelationPoint < 0 || pointModels.TrainingPoint < 0 {
            pointModels.EndingGet = 3
        } else {
            pointModels.EndingGet = 2
        }
    }
}
