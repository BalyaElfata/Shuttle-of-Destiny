import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var context
    var pointModels: DataItem
    @State var alreadyChoose: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20.0)
            
            HStack {
                Text("Day Counter: \(pointModels.Days)")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
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
