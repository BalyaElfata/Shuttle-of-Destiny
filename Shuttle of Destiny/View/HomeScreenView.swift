//
//  HomeScreenView.swift
//  Shuttle of Destiny
//
//  Created by Balya Elfata on 24/06/24.
//

import SwiftUI
import UIKit
import SwiftData

struct HomeScreenView: View {
    @State private var animateScreenViews = false
    @State private var showPrologueForStart = false
    
    var body: some View {
        if showPrologueForStart {
            PrologView()
//                .environmentObject(GameplayViewModel())
        } else {
            ZStack {
                Image("Home Screen Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                ZStack{
                    Image("Shuttle of Destiny Logo")
                        .offset(y: -30)
                    Button{
                        Helper.sharedHelper.playClickSfx()
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                        showPrologueForStart = true
                    }label: {
                        Image("Start Button")
                    }
                    .offset(y: 125)
                }
            }
            .onAppear {
                Helper.sharedHelper.playMenuMusic()
            }
            
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    
    return HomeScreenView()
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(GameplayViewModel())
}
