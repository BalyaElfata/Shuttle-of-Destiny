//
//  ADVView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 18/06/24.
//

import SwiftUI

struct ADVView: View {
    @State private var showDailyPlayViewForPrologue = false
    @State private var showDailyPlayView = false
    @State private var showEODProgressView = false
    @State private var showEndingView = false
    
    var body: some View {
        
        if showDailyPlayViewForPrologue {
            // show or go to daily play (day 1) after prologue
        }else if showDailyPlayView {
            // show or go to daily play (day 2, 3, etc.)
        } else if showEODProgressView {
            // show end of day progress, for after sudden events situation
        } else if showEndingView {
            EndingView()
        }
        GeometryReader { geo in
            ZStack {
                Color.colorPaletteThree
                HStack {
                    
                    VStack {
                        Spacer()
                        
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .frame(width: geo.size.width * 1, height: geo.size.height * 0.4)
                            .offset(x: -25, y: -25)
                            .opacity(0.8)
                            .overlay(alignment: .topLeading) {
                                Text("Hello!")
                                    .frame(alignment: .topLeading)
                                    .foregroundStyle(.white)
                                    .font(.custom(Constants.vtFont, size: geo.size.width * Constants.smallTextSize))
                            }
                            .overlay(alignment: .bottomTrailing) {
                                Image(systemName: "tennis.racket")
                                    .frame(alignment: .topLeading)
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                    .offset(x: -40, y: -40)
                            }
                    }
                }
                .onAppear {
                    if !showDailyPlayViewForPrologue {
                        Helper.sharedHelper.playPrologueMusic()
                    } else {
                        Helper.sharedHelper.playADVMusic()
                    }
                }
            }
            .ignoresSafeArea()
            .frame(width: geo.size.width, height: geo.size.height)

        }
    }
}

#Preview {
    ADVView()
}
