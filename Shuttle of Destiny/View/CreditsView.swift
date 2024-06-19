//
//  CreditsView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 19/06/24.
//

import SwiftUI

struct CreditsView: View {
    @State private var animateScreenViews = false
    @State private var showAcknowledgment = false
    
    var body: some View {
        if showAcknowledgment {
            AcknowledgementView()
        } else {
            GeometryReader { geo in
                ZStack {
                    Color.main
                    
                    VStack {
                                Text("Created in JKT with love by \n\n DRIM")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                    .frame(width: geo.size.width * Constants.mediumGapSize, height: geo.size.height * Constants.mediumGapSize)
                                
                                Text("Balya Elfata")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                Text("Geraldo")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                Text("Hose")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                Text("Lonard Steven")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                Text("Sony Chandra")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                Text("Valentinus Kenji")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        Helper.sharedHelper.playClickSfx()
                                        
                                        showAcknowledgment = true
                                    } label: {
                                        Image(systemName: "arrow.right.circle")
                                            .font(.largeTitle)
                                            .fontWeight(.heavy)
                                            .tint(.white)
                                    }
                                }

                            }
                            .padding(.horizontal, geo.size.width * Constants.smallGapSize)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    CreditsView()
}
