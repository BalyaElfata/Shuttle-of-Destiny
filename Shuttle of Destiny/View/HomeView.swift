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
            
            if alreadyChoose == true {
                DaySummaryView(pointModels: pointModels, alreadyChoose: $alreadyChoose)
            } else {
                DailyEvents(pointModels: pointModels, alreadyChoose: $alreadyChoose)
            }
            
            Spacer()
        }
    }
}

#Preview {
    
    let container = try! ModelContainer(for: DataItem.self)
    
    do{
        return HomeView(pointModels: DataItem(), alreadyChoose: false)
            .modelContainer(container)
    }catch{
        print("Error")
    }
    

}
