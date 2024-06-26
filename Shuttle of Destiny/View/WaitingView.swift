//
//  WaitingView.swift
//  Shuttle of Destiny
//
//  Created by Lonard Steven on 26/06/24.
//

import SwiftUI
import SwiftData

struct WaitingView: View {
    
    @State var showEndProgress = false
    
    @State private var animateScreenViews = false
    
    @Environment(\.modelContext) private var context
    var pointModels: PointModel
    @Binding var alreadyChoose: Bool
    @Binding var suddenDays: Bool
    
    var body: some View {
        
        if showEndProgress {
            EndProgressView(pointModels: pointModels, alreadyChoose: $alreadyChoose, suddenDays: $suddenDays)
        } else {
            GeometryReader { geo in
                if alreadyChoose {
                    if !suddenDays {
                        ZStack {
                            ZStack {
                                switch pointModels.ChoiceID {
                                case 1:
                                    Image("mia_house_bg")
                                        .resizable()
                                        .scaledToFill()
                                    
                                case 2:
                                    Image("training_center_bg")
                                        .resizable()
                                        .scaledToFill()
                                    
                                case 3:
                                    Image("hospital_room_bg")
                                        .resizable()
                                        .scaledToFill()
                                          
                                default:
                                    Image("park")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            
                            
                            ZStack {
                                if animateScreenViews {
                                    HStack {
                                        VStack {
                                            switch pointModels.ChoiceID {
                                            case 1:
                                                Image("mia_alternate")
                                                    .resizable()
                                                    .frame(width: 175, height: 225)
                                                
                                                Spacer().frame(height: geo.size.width * Constants.verySmallGapSize)
                                                Text("Alex is dating...")
                                                
                                            case 2:
                                                Image("coach_main")
                                                    .resizable()
                                                    .frame(width: 150, height: 225)
                                                Spacer().frame(height: geo.size.width * Constants.verySmallGapSize)
                                                    Text("Alex is training...")
                                                
                                            case 3:
                                                Image("dad_alternate")
                                                    .resizable()
                                                    .frame(width: 150, height: 225)
                                                
                                                Spacer().frame(height: geo.size.width * Constants.verySmallGapSize)
                                                Text("Alex is visiting his dad...")
                                                
                                            default:
                                                Image("mia_alternate")
                                                    .resizable()
                                                    .frame(width: 175, height: 225)
                                                
                                                Spacer().frame(height: geo.size.width * Constants.verySmallGapSize)
                                                
                                                Text("Alex is what?...")
                                            }
                                        }
                                    }
                                    .foregroundColor(.white)
                                    .font(.custom(Constants.vtFont, size: geo.size.height * Constants.largeTextSize))
                                    .frame(width: geo.size.width * Constants.boxSize, height: geo.size.height * Constants.boxSize)
                                    .background {
                                        RoundedRectangle(cornerRadius: 50)
                                            .opacity(0.6)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        .ignoresSafeArea()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                showEndProgress = true
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                animateScreenViews = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    
    return WaitingView(pointModels: PointModel(), alreadyChoose: .constant(true), suddenDays: .constant(false))
        .modelContainer(container)
        .modelContainer(container2)

}
