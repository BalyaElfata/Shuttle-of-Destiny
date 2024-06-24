import SwiftUI
import SwiftData

struct HomeView: View {
    
    @EnvironmentObject private var gameplay: GameplayViewModel
    @Environment(\.modelContext) private var context
    var pointModels: DataItem
    var gamePlay: SuddenPointModel
    @State var alreadyChoose: Bool = false
    @State var suddenDays: Bool = false
    
    var body: some View {
        ZStack {
            Spacer()
                .frame(height: 20.0)
            
            VStack {
                HStack {
                    Text("Day Counter: \(pointModels.Days)")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 275.0)
            }
            
            if alreadyChoose {
                
                if suddenDays {
                    SuddenEventListView(viewModel: gameplay, pointModels: pointModels, gameplays: [gamePlay], gotEvent: gamePlay)
                } else {
                    DaySummaryView(pointModels: pointModels, alreadyChoose: $alreadyChoose)
                }
            
            } else {
                DailyEvents(pointModels: pointModels, alreadyChoose: $alreadyChoose, suddenDays: $suddenDays)
            }
            
            
            
            
            
            Spacer()
        }
        .onAppear {
            Randomizer.randomizeSuddenDays(for: pointModels)
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: DataItem.self)
    let container2 = try! ModelContainer(for: Gameplay.self)
    
    
    let event = [
        SuddenPointModel(SuddenEventTitles: ["Sudden Title"], SuddenEventDescs: ["Sudden Event Description"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1],SuddenEventType: 1, id: 0, Used: false)
    ]
    
    return HomeView(pointModels: DataItem(), gamePlay: event[0], alreadyChoose: false, suddenDays: false)
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(GameplayViewModel())
}

