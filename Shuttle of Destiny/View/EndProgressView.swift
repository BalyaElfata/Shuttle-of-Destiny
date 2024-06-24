//
//  EndProgressView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 19/06/24.
//

import SwiftUI
import SwiftData

struct EndProgressView: View {
    @State var showADV = false
    @State var showEndingView = false
    @State var showDailyEventView = false
    
    @State private var animateScreenViews = false
    
    @Environment(\.modelContext) private var context
    var pointModels: PointModel
    @Binding var alreadyChoose: Bool
    
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
                    Image("room_eod")
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height)
                    
                    HStack {
                        if animateScreenViews {
                            VStack {
                                
                                Text("Good night!")
                                    .font(.custom(Constants.vtFont, size: geo.size.width * Constants.textSize))
                                    .multilineTextAlignment(.center)
                                    .padding(.top, geo.size.height * Constants.titleSize)
                                
                                Spacer()
                                    .frame(width: geo.size.width * Constants.verySmallGapSize, height: geo.size.height * Constants.verySmallGapSize)
                                
                                VStack {
                                
                                    
                                    Text("DAY-\(pointModels.Days)")
                                        .font(.custom(Constants.vtFont, size: geo.size.height * Constants.largeTextSize))
                                    
                                    Spacer()
                                        .frame(height: geo.size.width * Constants.verySmallGapSize)
                                    
                                    Text("Training: \(pointModels.TrainingPoint)")
                                        .font(.custom(Constants.vtFont, size: geo.size.height * Constants.midiTextSize))
                                    Text("Family: \(pointModels.FamilyPoint)")
                                        .font(.custom(Constants.vtFont, size: geo.size.height * Constants.midiTextSize))
                                    Text("Relationship: \(pointModels.RelationPoint)")
                                        .font(.custom(Constants.vtFont, size: geo.size.height * Constants.midiTextSize))
                                  
                                    Spacer()
                                        .frame(height: geo.size.width * Constants.smallGapSize)
                                }

                                .padding()
                                .preferredColorScheme(.dark)
                            }
                            .foregroundColor(.black)
                            .background {
                                Image("background overlay")
                                    .resizable()
                                    .frame(width: geo.size.width * Constants.imageScale)
                            }
                            .padding(.horizontal, geo.size.width * Constants.smallGapSize)
                            .onTapGesture {
                                alreadyChoose = false
                                pointModels.Days += 1
                                do {
                                    try context.save()
                                } catch {
                                    print("Failed to save data item: \(error.localizedDescription)")
                                }
                            }
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
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    
    return EndProgressView(pointModels: PointModel(), alreadyChoose: .constant(false))
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(GameplayViewModel())
}
