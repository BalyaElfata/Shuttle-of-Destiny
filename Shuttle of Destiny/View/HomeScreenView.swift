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
    @State private var showCustomNameOverlay = false
    @State private var showPrologueForStart = false
    
    @State private var playerName : String = "Alex"
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        if showPrologueForStart {
            PrologView(playerName: $playerName)
                .environmentObject(SuddenEventViewModel())
        } else {
            GeometryReader { geo in
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
                            showCustomNameOverlay = true
                        }label: {
                            Image("Start Button")
                        }
                        .offset(y: 125)
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .onAppear {
                    Helper.sharedHelper.playMenuMusic()
                }
                .overlay {
                    if(showCustomNameOverlay) {
                        Image("background overlay")
                            .resizable()
                            .frame(width: geo.size.width * Constants.midiLargeBoxSize, height: geo.size.height * Constants.midiLargeBoxSize)
                            .overlay {
                                VStack {
                                    Text("Input your name, please?")
                                        .font(.custom(Constants.vtFont, size: geo.size.height * Constants.largeTextSize))
                                        .multilineTextAlignment(.center)
                                    
                                    TextField("Your name is...", text: $playerName)
                                        .font(.custom(Constants.vtFont, size: geo.size.height * Constants.largeTextSize))
                                        .frame(width: geo.size.width * Constants.smallBoxSize)
                                        .textFieldStyle(.roundedBorder)
                                    
                                    Button {
                                        showPrologueForStart = true
                                    } label: {
                                        Image("Start Button")
                                            .resizable()
                                            .frame(width: geo.size.width * Constants.verySmallBoxSize, height: geo.size.height * Constants.verySmallBoxSize)
                                    }
                                }
                            }
                        
                        
                    }

                }
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
        .environmentObject(SuddenEventViewModel())
}
