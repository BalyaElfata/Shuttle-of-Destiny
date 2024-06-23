//
//  HomeScreenView.swift
//  Shuttle of Destiny
//
//  Created by Balya Elfata on 24/06/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var animateScreenViews = false
    @State private var showPrologueForStart = false
    
    var body: some View {
        if showPrologueForStart {
            PrologView()
        } else {
            ZStack {
                Image("Home Screen Background")
                ZStack{
                    Image("Shuttle of Destiny Logo")
                        .offset(y: -30)
                    Image("Start Button")
                        .offset(y: 125)
                        .onTapGesture {
                            showPrologueForStart = true
                        }
                }
            }
            .onAppear {
                Helper.sharedHelper.playMenuMusic()
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
