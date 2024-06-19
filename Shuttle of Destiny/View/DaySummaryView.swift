import SwiftUI
import SwiftData

struct DaySummaryView: View {

    @Environment(\.modelContext) private var context
    @Query private var dataItems: [DataItem]
    @Binding var alreadyChoose: Bool

    var body: some View {
        guard let dataItem = dataItems.first else {
            return AnyView(Text("No data available"))
        }
        
        return AnyView(
            ZStack {
                Rectangle()
                    .fill(Color(hex: "#85292B"))
                    .cornerRadius(30)
                    .frame(width: 300, height: 300)
                
                VStack {
                    Spacer()
                        .frame(height: 30.0)
                    
                    Text("Day Summary")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Spacer()
                        .frame(height: 50.0)
                    
                    Text("Training: \(dataItem.TrainingPoint)")
                    Text("Family: \(dataItem.FamilyPoint)")
                    Text("Relationship: \(dataItem.RelationPoint)")
                    
                    Spacer()
                        .frame(height: 30.0)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color(hex: "#FFFFFF"))
                            .cornerRadius(30)
                            .frame(width: 180, height: 60)
                        
                        Button(action: {
                            alreadyChoose = false
                            do {
                                try context.save()
                            } catch {
                                print("Failed to save data item: \(error.localizedDescription)")
                            }
                        }) {
                            Text("Next")
                                .font(.title2)
                                .foregroundColor(.red)
                                .frame(width: 360.0, height: 60.0)
                        }
                    }
                    
                    Spacer()
                        .frame(height: 50.0)
                }
                .padding()
                .preferredColorScheme(.dark)
            }
        )
    }
}

#Preview {
    DaySummaryView(alreadyChoose: .constant(false))
}
