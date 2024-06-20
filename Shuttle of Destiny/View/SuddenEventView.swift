//
//  SuddenEventView.swift
//  Shuttle of Destiny
//
//  Created by Geraldo Pannanda Lutan on 20/06/24.
//

import SwiftUI
import SwiftData


class GameplayViewModel: ObservableObject {
    @Published var gameplays: [Gameplay] = []
    
    
    init() {
        // Load or create initial data
        self.gameplays = [
            Gameplay(SuddenEventTitles: ["Sudden Title 1"], SuddenEventDescs: ["Sudden Event Description 1"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1], Used: false),
            Gameplay(SuddenEventTitles: ["Sudden Title 2"], SuddenEventDescs: ["Sudden Event Description 2"], SuddenPointPluses: [2], SuddenPointMinuses: [2], SuddenPointPlusesOther: [2], SuddenPointMinusesOther: [2], Used: false)
            
            
        ]
    }
}

struct SuddenEventListView: View {
    
    @ObservedObject var viewModel: GameplayViewModel
    var pointModels: DataItem
    
    var body: some View {
        VStack {
            ForEach(viewModel.gameplays) { suddenEvent in
                VStack {
                    Text("\(suddenEvent.SuddenEventTitles.first ?? "Unknown Title")")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    Spacer().frame(height: 10.0)
                    
                    Text("\(suddenEvent.SuddenEventDescs.first ?? "No Description")")
                    
                    Spacer().frame(height: 30.0)
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(Color(hex: "#85292B"))
                                .cornerRadius(30)
                                .frame(width: 140, height: 170)
                            
                            Button(action: {
                                
                            }) {
                                Text("Yes")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(width: 140, height: 170)
                            }
                        }
                        
                        Spacer().frame(width: 80.0, height: 0.0)
                        
                        ZStack {
                            Rectangle()
                                .fill(Color(hex: "#85292B"))
                                .cornerRadius(30)
                                .frame(width: 140, height: 170)
                            
                            Button(action: {
                                
                            }) {
                                Text("No")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .frame(width: 140, height: 170)
                            }
                        }
                    }
                }
                .padding()
            }
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
    
//    private func updatePoints(for category: PointCategory) {
//        switch category {
//        case .relationship:
//            pointModels.RelationPoint += 1
//        case .training:
//            pointModels.TrainingPoint += 1
//        case .family:
//            pointModels.FamilyPoint += 1
//        }
//        
//        pointModels.Days += 1
//        alreadyChoose = true
//        
//        
//        do {
//            try context.save()
//        } catch {
//            print("Failed to save data item: \(error.localizedDescription)")
//        }
//    }
}

#Preview {
    let container = try! ModelContainer(for: Gameplay.self)
    let container2 = try! ModelContainer(for: DataItem.self)
    
    let event = [
        Gameplay(SuddenEventTitles: ["Sudden Title"], SuddenEventDescs: ["Sudden Event Description"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1], Used: false)
    ]
    
    let viewModel = GameplayViewModel()
            viewModel.gameplays = event
    
    return SuddenEventListView(viewModel: viewModel, pointModels: DataItem()).modelContainer(container).modelContainer(container2)
        
}
