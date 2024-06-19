//
//  EndingView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 18/06/24.
//

import SwiftUI

struct EndingView: View {
    @State private var showBadEnding = true
    @State private var showGoodEnding = false
    @State private var showNeutralEnding = false
    @State private var showCreditsMainMenu = false
    
    @State private var animateScreenViews = false
    
    var body: some View {
        
        if showCreditsMainMenu {
            ContentView()
        } else {
            GeometryReader { geo in
                ZStack {
                    showGoodEnding ? Color.colorPaletteTwo : showNeutralEnding ? Color.colorPaletteThree : showBadEnding ? Color.red : Color.colorPaletteTwo
                    HStack {
                        if animateScreenViews {
                            HStack {
                                VStack {
                                    Spacer()
                                    
                                    Text(showGoodEnding ?
                                            "Ending 1 \n Golden Ending \n CONGRATULATIONS!"
                                         : showNeutralEnding ?
                                            "Ending 2 \n Okay Ending. Okay?"
                                         : showBadEnding ?
                                            "Ending 3 \n BAD ENDING \n Why? Why? Why you...?"
                                         : "Ending 1 \n Golden Ending \n CONGRATULATIONS!")
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(.white)
                                        .font(.custom(Constants.vtFont, size: geo.size.width * Constants.textSize))
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    if showGoodEnding {
                        Helper.sharedHelper.playGoodEDMusic()
                    } else if showNeutralEnding {
                        Helper.sharedHelper.playNeutralEDMusic()
                    } else if showBadEnding {
                        Helper.sharedHelper.playBadEDMusic()
                    } else {
                        Helper.sharedHelper.playGoodEDMusic()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        animateScreenViews = true
                    }
                }
                .onTapGesture {
                    showCreditsMainMenu = true
                }
                .ignoresSafeArea()
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

#Preview {
    EndingView()
}
