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
            // relationship
            SuddenPointModel(SuddenEventTitles: "Mia is missing you, she wants to meet you.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 1, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Mia is sad, will you get her flowers.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 3, SuddenPointMinuses: 2, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 2, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "The movie that Mia is a big fan of is coming out, she wants you to accompany her.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 2, SuddenPointPlusesOther: 4, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 3, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Mia is not feeling good, she wants to go to the doctor.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 5, SuddenPointMinuses: 2, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 4, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Mia wants to look at venues for the wedding, she wants you to come.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 3, SuddenPointPlusesOther: 6, SuddenPointMinusesOther: 3 ,SuddenEventType: 1, id: 5, Used: false),
            
            // career
            
            SuddenPointModel(SuddenEventTitles: "A social media post gone viral shown Alex training. He wanted to give appreciation to it.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 6, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Your main rival Thomas is looking tough to beat, you need to train.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 3, SuddenPointMinuses: 2, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 7, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "You got some conditioning to do, you're falling behind.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 2, SuddenPointPlusesOther: 4, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 8, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Your coach secured you a wonderful training partner, you have to come.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 5, SuddenPointMinuses: 2, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 9, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Marcus has challenged you in an official exhibition match that is shown on national TV & social media.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 3, SuddenPointPlusesOther: 6, SuddenPointMinusesOther: 3, SuddenEventType: 2, id: 10, Used: false),
            
            // family
            SuddenPointModel(SuddenEventTitles: "Your father misses you, he want you to visit him.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 3, id: 11, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Your father misses you and hates the food in the hospital, bring him his favorite food.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 3, SuddenPointMinuses: 2, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 3,SuddenEventType: 3, id: 12, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Your father just got out from a long treatment session, go and meet him.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 2, SuddenPointPlusesOther: 4, SuddenPointMinusesOther: 4,SuddenEventType: 3, id: 13, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Your father just had a seizure, he needs you.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 5, SuddenPointMinuses: 2, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 5,SuddenEventType: 3, id: 14, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Your father just got admitted to the operating room, you need to go.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 3, SuddenPointPlusesOther: 6, SuddenPointMinusesOther: 3, SuddenEventType: 3, id: 15, Used: false)
            
        ]
    }
}
