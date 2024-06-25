//
//  AcknowledgementView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 19/06/24.
//

import SwiftUI

struct AcknowledgementView: View {
    @State private var animateScreenViews = false
    @State private var showMainMenu = false
    
    var body: some View {
        if showMainMenu {
            HomeScreenView()
        } else {
            GeometryReader { geo in
                ZStack {
                    Color.main
                    
                            VStack {
                                Text("Music & sound effects")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                    .frame(width: geo.size.width * Constants.mediumGapSize, height: geo.size.height * Constants.mediumGapSize)
                                
                                Text("'Victory Screen', 'Epic Battle' & 'Waiting Time' \n by Lesiakower from Pixabay")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                Text("'Violet Sky' \n by Space_Cat from Pixabay")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                Text("'Blinding Light' & 'Victory Game' \n by Dream-Protocol in Pixabay")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.vertical, geo.size.width * Constants.verySmallGapSize)
                                
                                Text("Thank you for playing! Hehehe")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.smallTextSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, geo.size.width * Constants.smallGapSize)
                                
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        Helper.sharedHelper.playClickSfx()
                                        
                                        showMainMenu = true
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
    AcknowledgementView()
}
