import SwiftUI
import SwiftData

struct HomeView: View {
    
    @EnvironmentObject private var gameplay: GameplayViewModel
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
                    .scaledToFill()
                
                if alreadyChoose == true {
                    
                    if suddenDays == true {
                        SuddenEventListView(viewModel: gameplay, pointModels: pointModels, gameplays: [gamePlay], gotEvent: gamePlay, alreadyChoose: $alreadyChoose, suddenDays: $suddenDays)
                    } else {
                        EndProgressView(pointModels: pointModels, alreadyChoose: $alreadyChoose)
                    }
                
                } else {
                    DailyEvents(pointModels: pointModels, alreadyChoose: $alreadyChoose, suddenDays: $suddenDays)
                }
            }
            .onAppear {
                Randomizer.randomizeSuddenDays(for: pointModels)
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
        .environmentObject(GameplayViewModel())
}

