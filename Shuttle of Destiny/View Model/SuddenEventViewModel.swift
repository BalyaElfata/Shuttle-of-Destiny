//
//  SuddenEventViewModel.swift
//  Shuttle of Destiny
//
//  Created by Balya Elfata on 25/06/24.
//

import SwiftData
import SwiftUI

@MainActor
class SuddenEventViewModel: ObservableObject {
    @Published var suddenPointModels: [SuddenPointModel] = []
    
    init() {
        // Load or create initial data
        self.suddenPointModels = [
            SuddenPointModel(SuddenEventTitles: "Pacar ngajak jalan", SuddenEventDescs: "Ajak jalan gak?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 1 ,Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Hans ajak gym", SuddenEventDescs: "Mau ikut ato enggak?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 2, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Bapak kepleset", SuddenEventDescs: "Bapak lu kepleset apa yang anda harus lakukan?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 3, id: 3 ,Used: false),
        ]
    }
}
