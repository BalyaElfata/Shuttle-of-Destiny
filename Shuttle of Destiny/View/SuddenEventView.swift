//
//  SuddenEventView.swift
//  Shuttle of Destiny
//
//  Created by Geraldo Pannanda Lutan on 20/06/24.
//

import SwiftUI
import SwiftData

<<<<<<< HEAD

@MainActor
class GameplayViewModel: ObservableObject {
    @Published var gameplays: [SuddenPointModel] = []
    
    init() {
        // Load or create initial data
        self.gameplays = [
            // relationship
            SuddenPointModel(SuddenEventTitles: "Mia needed you in her house for chit-chat.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 2, SuddenPointMinuses: 3, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 2,SuddenEventType: 1, id: 1, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Alex realized that he forgot to bring back Mia's phone.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 5, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 3,SuddenEventType: 1, id: 1, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Mia's father called you for F1 racing match in circuit for couple approval.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 6, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 5,SuddenEventType: 1, id: 1, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Mia asked you to give his allowance per day for wedding proposal.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 7, SuddenPointMinuses: 7, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 7,SuddenEventType: 1, id: 1, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Mia asked you to join window shopping for find a familymaking book.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 8, SuddenPointMinuses: 9, SuddenPointPlusesOther: 6, SuddenPointMinusesOther: 8,SuddenEventType: 1, id: 1, Used: false),
            
            // career
            
            SuddenPointModel(SuddenEventTitles: "A social media post gone viral shown Alex training. He wanted to give appreciation to it.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 3, SuddenPointMinuses: 4, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 2, SuddenEventType: 2, id: 2, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Coach has been sick for days, but you're needed by him to go on an international tournament.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 4, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 3, SuddenEventType: 2, id: 2, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "You're meeting Taufik Hendrawan, an former world badminton player, during an tournament.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 6, SuddenPointPlusesOther: 4, SuddenPointMinusesOther: 3, SuddenEventType: 2, id: 2, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Your usual racket has been broken, but Coach fully funded you to buy the legendary racket, Yonax No. 1.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 7, SuddenPointMinuses: 5, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 4, SuddenEventType: 2, id: 2, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Marcus has challenged you in an official exhibition match that is shown on national TV & social media.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 9, SuddenPointMinuses: 10, SuddenPointPlusesOther: 7, SuddenPointMinusesOther: 7, SuddenEventType: 2, id: 2, Used: false),
            
            // family
            SuddenPointModel(SuddenEventTitles: "Dad has been slipped in the emergency ladder.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 3, SuddenPointMinuses: 2, SuddenPointPlusesOther: 2, SuddenPointMinusesOther: 3,SuddenEventType: 3, id: 3, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Smile! Your dad has been asked a video call, but you're in Madrid for a tournament.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 4, SuddenPointMinuses: 3, SuddenPointPlusesOther: 3, SuddenPointMinusesOther: 2,SuddenEventType: 3, id: 3, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Oh no! Your dad wanted you to move him into VIP room.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 6, SuddenPointMinuses: 3, SuddenPointPlusesOther: 5, SuddenPointMinusesOther: 4,SuddenEventType: 3, id: 3, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "A naggy journalist search your dad in hospital for interview, and you're asked to caught him.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 8, SuddenPointMinuses: 7, SuddenPointPlusesOther: 9, SuddenPointMinusesOther: 7,SuddenEventType: 3, id: 3, Used: false),
            
            SuddenPointModel(SuddenEventTitles: "Science is fun~ Vaccine for your dad's disease has been found.", SuddenEventDescs: "What do you do?", SuddenPointPluses: 11, SuddenPointMinuses: 8, SuddenPointPlusesOther: 6, SuddenPointMinusesOther: 5,SuddenEventType: 3, id: 3, Used: false)
            
        ]
    }
}

=======
>>>>>>> balya
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
<<<<<<< HEAD
                .onAppear {
                    gameplays = viewModel.gameplays
                    
                    gotEvent = randomizeSuddenEventId(gameplay: gameplays)
                    
                    while (pointModels.ChoiceID == gameplays.first?.SuddenEventType) && (gameplays.first?.Used == true) {
                        gotEvent = randomizeSuddenEventId(gameplay: gameplays)
                    }
=======
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
>>>>>>> balya
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
