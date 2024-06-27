//
//  EndingADVView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 26/06/24.
//

import SwiftUI
import SwiftData
import UIKit

struct EndingADVView: View {
    @State var conversationIndex = 0
    
    @State var conversationList: [String] = []
    
    let blackScreen = "  "
    let noConversation = " "
    let conversation1Alex = "Alex: I finally did it! I achieved my dreams."
    let conversation2Alex = "Alex: Looking back it was one hell of a ride. I’m satisfied with my own life right now."
    let conversation3Alex = "Alex: Where did it all go wrong. Damn it all!"
    let conversation4Alex = "Alex: Where did it all go wrong. Damn it all!"
    let conversation5Alex = "Alex: Where did it all go wrong. Damn it all!"
    
    var pointModels: PointModel
    
    @State var sceneNumber = 1
    
    @State private var showEndingInfo = false
    
    @State private var animatedText: String = ""


    var body: some View {
        if showEndingInfo {
            EndingView(pointModels: pointModels)
        } else {
            GeometryReader { geo in
                ZStack {
                    switch sceneNumber {
                    case 1:
                        Image("golden_ending_1")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(.all)
                    case 2:
                        Image("golden_ending_1")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(.all)
                    case 3:
                        Image("standard_ending_1")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(.all)
                    case 4:
                        Image("bad_ending_relationship")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(.all)
                    case 5:
                        Image("bad_ending_career")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(.all)
                    case 6:
                        Image("bad_ending_family")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(.all)
                    default:
                        Image("park")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(.all)
                    }
                    VStack (){
                        Spacer()
                        ZStack {
                            Image("Chat Box")
                                .frame(width: geo.size.width * Constants.boxSize, height: geo.size.height * Constants.boxSize)
                                .overlay(alignment: .leading){
                                    Text(pointModels.EndingGet == 1 ? "Alex: I finally did it! I achieved my dreams." : pointModels.EndingGet == 2 ? "Alex: Looking back it was one hell of a ride. I’m satisfied with my own life right now." : pointModels.EndingGet == 3 ? "Alex: Where did it all go wrong. Damn it all!" : "This is a test text box.")
                                        .foregroundStyle(.black)
                                        .font(.custom(Constants.vtFont, size: geo.size.width * Constants.smallTextSize))
                                }
                                .offset(y: 85)
                        }
                    }
                }
                .onTapGesture {
                    if pointModels.EndingGet == 1 {
                        sceneNumber = 2
                    } else {
                        showEndingInfo = true
                    }
                    Helper.sharedHelper.playClickSfx()
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                }
                .onAppear {
                    EndingViewModel.calculateEndingTypes(for: pointModels)
                    
                    if pointModels.EndingGet == 1 {
                        sceneNumber = 1
                    } else if pointModels.EndingGet == 2 {
                        sceneNumber = 3
                    } else if pointModels.EndingGet == 3 && pointModels.RelationPoint < 0 {
                        sceneNumber = 4
                    } else if pointModels.EndingGet == 3 && pointModels.TrainingPoint < 0 {
                        sceneNumber = 5
                    } else if pointModels.EndingGet == 3 && pointModels.FamilyPoint < 0 {
                        sceneNumber = 6
                    }
                    
                    if pointModels.EndingGet == 1 {
                        Helper.sharedHelper.playGoodEDMusic()
                    } else if pointModels.EndingGet == 2 {
                        Helper.sharedHelper.playNeutralEDMusic()
                    } else if pointModels.EndingGet == 3 {
                        Helper.sharedHelper.playBadEDMusic()
                    } else {
                        Helper.sharedHelper.playGoodEDMusic()
                    }
                }
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    let dataItem = PointModel()
    
    return EndingADVView(pointModels: dataItem)
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(SuddenEventViewModel())
}
