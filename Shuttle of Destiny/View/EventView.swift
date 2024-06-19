//
//  EventView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 19/06/24.
//

import SwiftUI

struct EventView: View {
    @State var showEoD = false
    @State var showSuddenEvent = false
    
    @State private var animateScreenViews = false
    
    var body: some View {
        if showEoD {
            EndProgressView()
        } else if showSuddenEvent {
            // show sudden event choices!
        } else {
            GeometryReader { geo in
                ZStack {
                    Color.colorPaletteThree
                    
                    HStack {
                        if animateScreenViews {
                            VStack {
                                Text("A new day is a new day, too. What's should I do today?")
                                    .font(.custom(Constants.vtFont, size: geo.size.width * Constants.textSize))
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                    .frame(width: geo.size.width * Constants.mediumGapSize, height: geo.size.height * Constants.mediumGapSize)
                                
                                HStack {
                                    Button {
                                        Helper.sharedHelper.playClickSfx()
                                        
                                        showEoD = true
                                    } label: {
                                        Text("Train my badminton skill")
                                            .font(.custom(Constants.vtFont, size: geo.size.height * Constants.titleSize))
                                    }
                                    .padding(geo.size.height * Constants.smallGapSize)
                                    .background(Color.secondary)
                                    .clipShape(.rect(cornerRadius: 15))
                                    
                                    Button {
                                        Helper.sharedHelper.playClickSfx()
                                        
                                        showEoD = true
                                    } label: {
                                        Text("Check out my father")
                                            .font(.custom(Constants.vtFont, size: geo.size.height * Constants.titleSize))
                                    }
                                    .padding(geo.size.height * Constants.smallGapSize)
                                    .background(Color.secondary)
                                    .clipShape(.rect(cornerRadius: 15))
                                    
                                    Button {
                                        Helper.sharedHelper.playClickSfx()
                                        
                                        showEoD = true
                                    } label: {
                                        Text("Meet Mia!")
                                            .font(.custom(Constants.vtFont, size: geo.size.height * Constants.titleSize))
                                    }
                                    .padding(geo.size.height * Constants.smallGapSize)
                                    .background(Color.secondary)
                                    .clipShape(.rect(cornerRadius: 15))
                                }
                                .tint(Color.white)
                            }
                            .padding(.horizontal, geo.size.width * Constants.smallGapSize)
                        }
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .onAppear {
                Helper.sharedHelper.playGameplayMusic()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    animateScreenViews = true
                }
            }
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    EventView()
}
