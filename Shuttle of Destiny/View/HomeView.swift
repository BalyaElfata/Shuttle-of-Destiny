import SwiftUI
import SwiftData

struct HomeView: View {
    
    @EnvironmentObject private var gameplay: SuddenEventViewModel
    @Environment(\.modelContext) private var context
    var pointModels: PointModel
    var gamePlay: SuddenPointModel
    @State var alreadyChoose: Bool = false
    @State var suddenDays: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("room_day")
                    .resizable()
                if pointModels.Days <= 30 && pointModels.FamilyPoint >= 0 && pointModels.RelationPoint >= 0 && pointModels.TrainingPoint >= 0 {
                    if alreadyChoose {
                        if suddenDays {
                            SuddenEventListView(viewModel: gameplay, pointModels: pointModels, gameplays: [gamePlay], gotEvent: gamePlay, alreadyChoose: $alreadyChoose, suddenDays: $suddenDays)
                        } else {
                            EndProgressView(pointModels: pointModels, alreadyChoose: $alreadyChoose, suddenDays: $suddenDays)
                        }
                    } else {
                        DailyEvents(pointModels: pointModels, alreadyChoose: $alreadyChoose, suddenDays: $suddenDays)
                    }
                } else {
                    EndingView(pointModels: pointModels)
                }
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .onAppear {
                EndingViewModel.calculateEndingTypes(for: pointModels)
                Helper.sharedHelper.playGameplayMusic()
                SuddenEventRandomizer.randomizeSuddenDays(for: pointModels)
            }
        }
        
    }
}

#Preview {
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    
    
    let event = [
        SuddenPointModel(SuddenEventTitles: "Sudden Title", SuddenEventDescs: "Sudden Event Description", SuddenPointPluses: 1, SuddenPointMinuses: 1, SuddenPointPlusesOther: 1, SuddenPointMinusesOther: 1,SuddenEventType: 1, id: 0, Used: false)
    ]
    
    return HomeView(pointModels: PointModel(), gamePlay: event[0], alreadyChoose: false, suddenDays: false)
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(SuddenEventViewModel())
}

