import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var context
    var pointModels: DataItem
    @State var alreadyChoose: Bool = false
    
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
                DaySummaryView(pointModels: pointModels, alreadyChoose: $alreadyChoose)
            } else {
                DailyEvents(pointModels: pointModels, viewModel: GameplayViewModel(), alreadyChoose: $alreadyChoose)
                
                
            }
            
            Spacer()
        }
        .onAppear {
            randomizeSuddenDaysForPointModels()
        }
    }
}

// Example function to be called on view appear
func randomizeSuddenDaysForPointModels() {
    Randomizer.randomizeSuddenDays(for: pointModels)
    print("\(pointModels.SuddenDays)")
}

#Preview {
    let container = try! ModelContainer(for: DataItem.self)
    
    
    return HomeView(pointModels: DataItem(), alreadyChoose: false)
        .modelContainer(container)
}

