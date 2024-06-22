//
//  Shuttle_of_DestinyApp.swift
//  Shuttle of Destiny
//
//  Created by Balya Elfata on 12/06/24.
//

//import SwiftUI
//
//@main
//struct Shuttle_of_DestinyApp: App {
//    var body: some Scene {
//        WindowGroup {
//            HomeView(alreadyChoose: false)
//        }.modelContainer(for: DataItem.self)
//    }
//}

import SwiftUI
import SwiftData

@main
struct Shuttle_of_DestinyApp: App {
    @StateObject private var gameplay = GameplayViewModel()
    let container: ModelContainer
    let container2: ModelContainer
    let event: [Gameplay]
    
    init() {
        container = try! ModelContainer(for: DataItem.self)
        container2 = try! ModelContainer(for: Gameplay.self)
        
        event = [
            Gameplay(SuddenEventTitles: ["Sudden Title"], SuddenEventDescs: ["Sudden Event Description"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1],SuddenEventType: 1, id: 0, Used: false)
        ]
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            HomeView(pointModels: DataItem(), gamePlay: event[0], alreadyChoose: false)
                .environmentObject(gameplay)
                
        }.modelContainer(container).modelContainer(container2)
    }
}
