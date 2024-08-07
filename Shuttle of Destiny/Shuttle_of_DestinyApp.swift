//
//  Shuttle_of_DestinyApp.swift
//  Shuttle of Destiny
//
//  Created by Balya Elfata on 12/06/24.
//

import SwiftUI

@main
struct Shuttle_of_DestinyApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .modelContainer(for: SuddenPointModel.self)
                .modelContainer(for: PointModel.self)
        }
    }
}
