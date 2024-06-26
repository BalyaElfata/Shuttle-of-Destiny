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
    @State private var showPhoneCall: Bool = true
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("background overlay")
                    .resizable()
                    .frame(width: geo.size.width * Constants.largeBoxSize, height: geo.size.height * Constants.largeBoxSize)
                VStack {
                    VStack {
                        Text("Will you do it? \n \(gotEvent.SuddenEventTitles)")
                            .font(.custom(Constants.vtFont, size: geo.size.height * Constants.largeTextSize))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .shadow(radius: 5)
                            .foregroundColor(.white)
                        
                        Spacer().frame(height: geo.size.height * Constants.smallGapSize)
                        
                        VStack {
                            ZStack {
                                
                                Button(action: {
                                    print("yes")
                                    
                                    Helper.sharedHelper.playClickSfx()
                                    
                                    if pointModels.ChoiceID == 1{
                                        suddenTypesYes(for: .relationshipYes)
                                        
                                    }else if pointModels.ChoiceID == 2{
                                        suddenTypesYes(for: .trainingYes)
                                        
                                    }else if pointModels.ChoiceID == 3{
                                        suddenTypesYes(for: .familyYes)
                                    }
                                    
                                }) {
                                    Image("sudden_event_yes")
                                }
                            }
                            
                            Spacer().frame(height: geo.size.height * Constants.smallGapSize)
                            
                            ZStack {
                                
                                Button(action: {
                                    print("no")
                                    print(pointModels.ChoiceID)
                                    
                                    Helper.sharedHelper.playClickSfx()
                                    
                                    if pointModels.ChoiceID == 1{
                                        suddenTypesYes(for: .relationshipNo)
                                        
                                    }else if pointModels.ChoiceID == 2{
                                        suddenTypesYes(for: .trainingNo)
                                        
                                    }else if pointModels.ChoiceID == 3{
                                        suddenTypesYes(for: .familyNo)
                                    }
                                    
                                }) {
                                    Image("sudden_event_no")
                                }
                            }
                        }
                        
                    }
                    .padding()
                    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                }
                .padding()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showPhoneCall = false
                }
                gameplays = viewModel.suddenPointModels
                
                gotEvent = SuddenEventRandomizer.randomizeSuddenEvent(for: gameplays, pointModel: pointModels)
                
                while (pointModels.ChoiceID == gameplays.first?.SuddenEventType) && (gameplays.first?.Used == true) {
                    gotEvent = SuddenEventRandomizer.randomizeSuddenEvent(for: gameplays, pointModel: pointModels)
                }
            }
            Image("Phone Call")
                .resizable()
                .scaledToFill()
                .opacity(showPhoneCall ? 1 : 0)
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
        gotEvent.Used = true
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
