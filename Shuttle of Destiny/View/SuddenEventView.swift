//
//  SuddenEventView.swift
//  Shuttle of Destiny
//
//  Created by Geraldo Pannanda Lutan on 20/06/24.
//

import SwiftUI
import SwiftData

struct SuddenEventListView: View {
    
    @ObservedObject var viewModel: SuddenEventViewModel
    var pointModels: PointModel
    @Environment(\.modelContext) private var context
    @State var gameplays: [SuddenPointModel]
    @State var gotEvent: SuddenPointModel
    @Binding var alreadyChoose: Bool
    @Binding var suddenDays: Bool
    
    var body: some View {
        ZStack {
            Image("background overlay")
                .resizable()
                .frame(width: 650)
            VStack {
                VStack {
                    Text("\(gotEvent.SuddenEventTitles)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    Spacer().frame(height: 10.0)
                    
                    Text("\(gotEvent.SuddenEventDescs)")
                    
                    Spacer().frame(height: 30.0)
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(Color(hex: "#85292B"))
                                .cornerRadius(30)
                                .frame(width: 140, height: 170)
                            
                            Button(action: {
                                print("yes")
                                if pointModels.ChoiceID == 1{
                                    suddenTypesYes(for: .relationshipYes)
                                    
                                }else if pointModels.ChoiceID == 2{
                                    suddenTypesYes(for: .trainingYes)
                                    
                                }else if pointModels.ChoiceID == 3{
                                    suddenTypesYes(for: .familyYes)
                                }
                                
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
                                print("no")
                                print(pointModels.ChoiceID)
                                if pointModels.ChoiceID == 1{
                                    suddenTypesYes(for: .relationshipNo)
                                    
                                }else if pointModels.ChoiceID == 2{
                                    suddenTypesYes(for: .trainingNo)
                                    
                                }else if pointModels.ChoiceID == 3{
                                    suddenTypesYes(for: .familyNo)
                                }
                                
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
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            }
            .onAppear {
                gameplays = viewModel.suddenPointModels
                
                gotEvent = Randomizer.randomizeSuddenEvent(for: gameplays, pointModel: pointModels)
                
                while (pointModels.ChoiceID == gameplays.first?.SuddenEventType) && (gameplays.first?.Used == true) {
                    gotEvent = Randomizer.randomizeSuddenEvent(for: gameplays, pointModel: pointModels)
                }
            }
        }
    }
    
    private func suddenTypesYes(for category: types) {
        print("Button tapped for Yes")
        switch category {
        case .relationshipYes:
            
            if gotEvent.SuddenEventType == 2{
                pointModels.RelationPoint -= gotEvent.SuddenPointMinuses
                pointModels.TrainingPoint += gotEvent.SuddenPointPlusesOther
                
            } else if gotEvent.SuddenEventType == 3{
                pointModels.RelationPoint -= gotEvent.SuddenPointMinuses
                pointModels.FamilyPoint += gotEvent.SuddenPointPlusesOther
            }
            
        case .trainingYes:
            
            if gotEvent.SuddenEventType == 1 {
                pointModels.TrainingPoint -= gotEvent.SuddenPointMinuses
                pointModels.RelationPoint += gotEvent.SuddenPointPlusesOther
                
            } else if gotEvent.SuddenEventType == 3{
                pointModels.TrainingPoint -= gotEvent.SuddenPointMinuses
                pointModels.FamilyPoint += gotEvent.SuddenPointPlusesOther
            }
            
        case .familyYes:
            
            if gotEvent.SuddenEventType == 1{
                pointModels.FamilyPoint -= gotEvent.SuddenPointMinuses
                pointModels.RelationPoint += gotEvent.SuddenPointPlusesOther
                
            } else if gotEvent.SuddenEventType == 2{
                pointModels.FamilyPoint -= gotEvent.SuddenPointMinuses
                pointModels.TrainingPoint += gotEvent.SuddenPointPlusesOther
            }
            
        case .relationshipNo:
            if gotEvent.SuddenEventType == 2{
                pointModels.RelationPoint += gotEvent.SuddenPointPluses
                pointModels.TrainingPoint -= gotEvent.SuddenPointMinusesOther
                
            } else if gotEvent.SuddenEventType == 3{
                pointModels.RelationPoint += gotEvent.SuddenPointPluses
                pointModels.FamilyPoint -= gotEvent.SuddenPointMinusesOther
            }
            
        case .trainingNo:
            if gotEvent.SuddenEventType == 1{
                pointModels.TrainingPoint += gotEvent.SuddenPointPluses
                pointModels.RelationPoint -= gotEvent.SuddenPointMinusesOther
                
            } else if gotEvent.SuddenEventType == 3{
                pointModels.TrainingPoint += gotEvent.SuddenPointPluses
                pointModels.FamilyPoint -= gotEvent.SuddenPointMinusesOther
            }
            
        case .familyNo:
            if gotEvent.SuddenEventType == 1{
                pointModels.FamilyPoint += gotEvent.SuddenPointPluses
                pointModels.RelationPoint -= gotEvent.SuddenPointMinusesOther
                
            } else if gotEvent.SuddenEventType == 2{
                pointModels.FamilyPoint += gotEvent.SuddenPointPluses
                pointModels.TrainingPoint -= gotEvent.SuddenPointMinusesOther
            }
           
        }
        alreadyChoose = true
        suddenDays = false
        
        do {
            try context.save()
        } catch {
            print("Failed to save data item: \(error.localizedDescription)")
        }
    }
    
}

enum types {
    case relationshipYes, trainingYes, familyYes, relationshipNo, trainingNo, familyNo
}



#Preview {
    let container = try! ModelContainer(for: SuddenPointModel.self)
    let container2 = try! ModelContainer(for: PointModel.self)
    
    let event = [
        SuddenPointModel(SuddenEventTitles: "Sudden Title", SuddenEventDescs: "Sudden Event Description", SuddenPointPluses: 1, SuddenPointMinuses: 1, SuddenPointPlusesOther: 1, SuddenPointMinusesOther: 1,SuddenEventType: 0, id: 0, Used: false)
    ]
    
    let viewModel = SuddenEventViewModel()
            viewModel.suddenPointModels = event
    
    return SuddenEventListView(viewModel: viewModel, pointModels: PointModel(), gameplays: event, gotEvent: event[0], alreadyChoose: .constant(false), suddenDays: .constant(true)).modelContainer(container)
        .modelContainer(container2)
        .environmentObject(SuddenEventViewModel())
        
}
