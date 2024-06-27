//
//  SplashScreenView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 26/06/24.
//

import SwiftUI
import SwiftData

struct SplashScreenView: View {
    @State private var showMenu = false
    @State private var animateScreenViews = false
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        GeometryReader { geo in
            if showMenu {
                HomeScreenView()
            } else {
                ZStack {
                    Color.blue
                    if animateScreenViews {
                        ZStack {
                            Image("drim_logo")
                                .resizable()
                                .frame(width: geo.size.width * Constants.smallBoxSize, height: geo.size.height * Constants.boxSize)
                                .multilineTextAlignment(.center)
                            
                        }
                    }
                }
                .onTapGesture {
                    showMenu = true
                }
                .ignoresSafeArea()
                .frame(width: geo.size.width, height: geo.size.height)
                .onAppear {
                    Helper.sharedHelper.playDrimLogoSfx()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.easeInOut(duration: 3)) {
                            animateScreenViews = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                        showMenu = true
                    }
                }
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    
    return SplashScreenView()
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(SuddenEventViewModel())
}
