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
            SuddenPointModel(SuddenEventTitles: ["Bapak kepleset"], SuddenEventDescs: ["Bapak lu kepleset apa yang anda harus lakukan?"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1],SuddenEventType: 3, id: 1 ,Used: false),
            
            SuddenPointModel(SuddenEventTitles: ["Pacar ngajak jalan"], SuddenEventDescs: ["Ajak jalan gak?"], SuddenPointPluses: [2], SuddenPointMinuses: [2], SuddenPointPlusesOther: [2], SuddenPointMinusesOther: [2],SuddenEventType: 1, id: 2 ,Used: false),
            
            SuddenPointModel(SuddenEventTitles: ["Hans ajak gym"], SuddenEventDescs: ["Mau ikut ato enggak?"], SuddenPointPluses: [2], SuddenPointMinuses: [2], SuddenPointPlusesOther: [2], SuddenPointMinusesOther: [2], SuddenEventType: 2, id: 3, Used: false)
            
        ]
    }
}

struct SuddenEventListView: View {
    
    @ObservedObject var viewModel: GameplayViewModel
    var pointModels: DataItem
    @State var gameplays: [SuddenPointModel]
    @State var gotEvent: SuddenPointModel
    
//    init(){
//        gameplays = viewModel.gameplays
//    }
    
    var body: some View {
        VStack {
            VStack {
                
                Text("\(gotEvent.SuddenEventTitles.first ?? "Unknown Title")")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Spacer().frame(height: 10.0)
                
                Text("\(gotEvent.SuddenEventDescs.first ?? "No Description")")
                
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
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
        .onAppear {
            gameplays = viewModel.gameplays
            
            gotEvent = randomizeSuddenEventId(gameplay: gameplays)
            
            while (pointModels.ChoiceID == gameplays.first?.SuddenEventType) && (gameplays.first?.Used == true) {
                gotEvent = randomizeSuddenEventId(gameplay: gameplays)
            }
        }
    }
    
    func randomizeSuddenEventId(gameplay: [SuddenPointModel]) -> SuddenPointModel {
        return Randomizer.randomizeSuddenEvent(for: gameplays)
    }
    
}



#Preview {
    let container = try! ModelContainer(for: Gameplay.self)
    let container2 = try! ModelContainer(for: DataItem.self)
    
    let event = [
        SuddenPointModel(SuddenEventTitles: ["Sudden Title"], SuddenEventDescs: ["Sudden Event Description"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1],SuddenEventType: 0, id: 0, Used: false)
    ]
    
    let viewModel = GameplayViewModel()
            viewModel.gameplays = event
    
    return SuddenEventListView(viewModel: viewModel, pointModels: DataItem(), gameplays: event, gotEvent: event[0]).modelContainer(container)
        .modelContainer(container2)
        
}
