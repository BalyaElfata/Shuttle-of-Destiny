//
//  SuddenEventView.swift
//  Shuttle of Destiny
//
//  Created by Geraldo Pannanda Lutan on 20/06/24.
//

import SwiftUI
import SwiftData


@MainActor
class GameplayViewModel: ObservableObject {
    @Published var gameplays: [SuddenPointModel] = []
    
    init() {
        // Load or create initial data
        self.gameplays = [
            SuddenPointModel(SuddenEventTitles: "Bapak kepleset", SuddenEventDescs: "Bapak lu kepleset apa yang anda harus lakukan?", SuddenPointPluses: 1, SuddenPointMinuses: 1, SuddenPointPlusesOther: 1, SuddenPointMinusesOther: 1,SuddenEventType: 3, id: 1 ,Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Pacar ngajak jalan", SuddenEventDescs: "Ajak jalan gak?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 2 ,Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Hans ajak gym", SuddenEventDescs: "Mau ikut ato enggak?", SuddenPointPluses: 2, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 3, Used: false)
            
        ]
    }
}

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
                    .frame(width: geo.size.width * Constants.boxSize, height: geo.size.height * Constants.boxSize)
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
            .frame(width: geo.size.width, height: geo.size.height)
            .onAppear {
                Helper.sharedHelper.playPhoneCallSfx()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    showPhoneCall = false
                }
                gameplays = viewModel.suddenPointModels
                
                gotEvent = SuddenEventRandomizer.randomizeSuddenEvent(for: gameplays, pointModel: pointModels)
                
                while (pointModels.ChoiceID == gotEvent.SuddenEventType) {
                    gotEvent = SuddenEventRandomizer.randomizeSuddenEvent(for: gameplays, pointModel: pointModels)
                }
            }
            Image("Phone Call")
                .resizable()
                .opacity(showPhoneCall ? 1 : 0)
                .ignoresSafeArea()
        }
    }
    
    func randomizeSuddenEventId(gameplay: [SuddenPointModel]) -> SuddenPointModel {
        return Randomizer.randomizeSuddenEvent(for: gameplays)
    }
    
    private func suddenTypesYes(for category: types) {
        print("Button tapped for Yes")
        switch category {
        case .relationshipYes:
            
            if gotEvent.SuddenEventType == 2{
                pointModels.ChoiceID = 2
                pointModels.RelationPoint -= gotEvent.SuddenPointMinuses
                pointModels.TrainingPoint += gotEvent.SuddenPointPlusesOther
                
            } else if gotEvent.SuddenEventType == 3{
                pointModels.ChoiceID = 3
                pointModels.RelationPoint -= gotEvent.SuddenPointMinuses
                pointModels.FamilyPoint += gotEvent.SuddenPointPlusesOther
            }
            
        case .trainingYes:
            pointModels.ChoiceID = 2
            
            if gotEvent.SuddenEventType == 1 {
                pointModels.ChoiceID = 1
                pointModels.TrainingPoint -= gotEvent.SuddenPointMinuses
                pointModels.RelationPoint += gotEvent.SuddenPointPlusesOther
                
            } else if gotEvent.SuddenEventType == 3{
                pointModels.ChoiceID = 3
                pointModels.TrainingPoint -= gotEvent.SuddenPointMinuses
                pointModels.FamilyPoint += gotEvent.SuddenPointPlusesOther
            }
            
        case .familyYes:
            pointModels.ChoiceID = 3
            
            if gotEvent.SuddenEventType == 1{
                pointModels.ChoiceID = 1
                pointModels.FamilyPoint -= gotEvent.SuddenPointMinuses
                pointModels.RelationPoint += gotEvent.SuddenPointPlusesOther
                
            } else if gotEvent.SuddenEventType == 2{
                pointModels.ChoiceID = 2
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
