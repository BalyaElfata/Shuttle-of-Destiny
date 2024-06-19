import SwiftUI
import SwiftData

struct HomeView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var dataItems: [DataItem]
    @State var alreadyChoose: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 20.0)
            
            HStack {
                Text("Day Counter: \(dataItems.first?.Days ?? 0)")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            if alreadyChoose == true {
                DaySummaryView(alreadyChoose: $alreadyChoose)
            } else {
//                DailyEvents(/*pointModels: DataItem()*/, alreadyChoose: $alreadyChoose)
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeView(alreadyChoose: false)
}
