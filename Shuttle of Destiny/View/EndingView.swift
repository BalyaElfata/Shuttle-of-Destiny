//
//  EndingView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 18/06/24.
//

import SwiftUI
import SwiftData

struct EndingView: View {
    @State private var showBadEnding = false
    @State private var showGoodEnding = false
    @State private var showNeutralEnding = false
    @State private var showDefaultEnding = false
    @State private var showCreditsMainMenu = false
    
    @State private var animateScreenViews = false
    
    var pointModels: PointModel
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        if showCreditsMainMenu {
            CreditsView()
        } else {
            GeometryReader { geo in
                ZStack {
                    showGoodEnding ? Color.colorPaletteTwo : showNeutralEnding ? Color.colorPaletteThree : showBadEnding ? Color.red : showDefaultEnding ? Color.gray : Color.black
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
                                         : "Ending X \n The Ending? \n Hmm..... You found it.")
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
                    
                    if pointModels.EndingGet == 1 {
                        showGoodEnding = true
                    } else if pointModels.EndingGet == 2 {
                        showNeutralEnding = true
                    } else if pointModels.EndingGet == 3 {
                        showBadEnding = true
                    } else {
                        showGoodEnding = true
                    }
                    
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
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    let dataItem = PointModel()
    
    return EndingView(pointModels: dataItem)
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(GameplayViewModel())
}
