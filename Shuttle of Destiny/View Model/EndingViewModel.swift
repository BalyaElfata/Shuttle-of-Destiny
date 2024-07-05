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
    static func calculateEndingTypes(for pointModels: PointModel) {
        if pointModels.FamilyPoint >= 12 && pointModels.RelationPoint >= 12 && pointModels.TrainingPoint >= 12 && pointModels.Days >= 30 {
            pointModels.EndingGet = 1
        } else if pointModels.Days >= 30 {
            pointModels.EndingGet = 2
        } else if (pointModels.FamilyPoint <= 0 || pointModels.RelationPoint <= 0 || pointModels.TrainingPoint <= 0) && pointModels.Days < 30 {
            pointModels.EndingGet = 3
        }
    }
}
