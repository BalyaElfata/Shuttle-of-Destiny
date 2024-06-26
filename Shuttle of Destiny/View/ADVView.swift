//
//  ADVView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 18/06/24.
//

import SwiftUI
import SwiftData

struct ADVView: View {
    @State private var showDailyPlayViewForPrologue = false
    @State private var showDailyPlayView = false
    @State private var showEODProgressView = false
    @State private var showEndingView = false
    
    @Query private var gameplayRun: [Gameplay]
    
    var body: some View {
        
        if showDailyPlayViewForPrologue {
            EventView()
        } else if showDailyPlayView {
            EventView()
        } else if showEODProgressView {
//            EndProgressView()
        } else if showEndingView {
            EndingView()
        } else {
            GeometryReader { geo in
                ZStack {
                    Color.colorPaletteThree
                    VStack {
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.4)
                            .offset(y: -25)
                            .opacity(0.8)
                            .overlay(alignment: .topLeading) {
                                Text("Hello, John! This is Shuttle of Destiny.")
                                    .frame(alignment: .topLeading)
                                    .foregroundStyle(.white)
                                    .font(.custom(Constants.vtFont, size: geo.size.width * Constants.smallTextSize))
                                    .offset(y:-20)
                                    .padding(15)
                            }
                            .overlay(alignment: .bottomTrailing) {
                                Image(systemName: "tennis.racket")
                                    .frame(alignment: .topLeading)
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                    .offset(x: -40, y: -40)
                            }
                    }
                    .onAppear {
                        if !showDailyPlayViewForPrologue {
                            Helper.sharedHelper.playPrologueMusic()
                        } else {
                            Helper.sharedHelper.playADVMusic()
                        }
                    }
                    .onTapGesture {
                        if !showDailyPlayViewForPrologue {
                            showDailyPlayViewForPrologue = true
                        } else if !showDailyPlayView {
                            showDailyPlayView = true
                        } else if !showEODProgressView {
                            showEODProgressView = true
                        } else if !showEndingView {
                            showEndingView = true
                        }
                    }
                }
                .ignoresSafeArea()
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

#Preview {
    ADVView()
}
