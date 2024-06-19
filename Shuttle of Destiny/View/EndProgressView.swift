//
//  EndProgressView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 19/06/24.
//

import SwiftUI

struct EndProgressView: View {
    @State var showADV = false
    @State var showEndingView = false
    @State var showDailyEventView = false
    
    @State private var animateScreenViews = false
    
    var body: some View {
        if showADV {
            ADVView()
        } else if showEndingView {
            EndingView()
        } else if showDailyEventView {
            EventView()
        } else {
            GeometryReader { geo in
                ZStack {
                    Color.black
                    
                    HStack {
                        if animateScreenViews {
                            VStack {
                                Text("Good night!")
                                    .font(.custom(Constants.vtFont, size: geo.size.width * Constants.textSize))
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                    .frame(width: geo.size.width * Constants.mediumGapSize, height: geo.size.height * Constants.mediumGapSize)
                            }
                            .padding(.horizontal, geo.size.width * Constants.smallGapSize)
                        }
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .onAppear {
                Helper.sharedHelper.playEODSfx()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    animateScreenViews = true
                }
            }
            .onTapGesture {
//                showADV = true
                showEndingView = true
//                showDailyEventView = true
            }
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    EndProgressView()
}
