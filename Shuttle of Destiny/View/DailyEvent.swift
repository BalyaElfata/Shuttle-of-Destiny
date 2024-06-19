import SwiftUI
import SwiftData

struct DailyEvents: View {
    
    var pointModels: DataItem
    @Environment(\.modelContext) private var context
    @Binding var alreadyChoose: Bool
    
    var body: some View {
        VStack {
            Text("What should I do?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10.0)
            
            Text("Choose one to focus on this day")
            
            Spacer().frame(height: 30.0)
            
            HStack {
                ZStack {
                    Rectangle()
                        .fill(Color(hex: "#85292B"))
                        .cornerRadius(30)
                        .frame(width: 140, height: 170)
                    
                    Button(action: {
                        updatePoints(for: .relationship)
                    }) {
                        Text("Relationship")
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
                        updatePoints(for: .training)
                    }) {
                        Text("Training")
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
                        updatePoints(for: .family)
                    }) {
                        Text("Family")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 140, height: 170)
                    }
                }
            }
        }
        .padding()
        .preferredColorScheme(.dark)
    }
    
    private func updatePoints(for category: PointCategory) {
        switch category {
        case .relationship:
            pointModels.RelationPoint += 1
        case .training:
            pointModels.TrainingPoint += 1
        case .family:
            pointModels.FamilyPoint += 1
        }
        
        pointModels.Days += 1
        alreadyChoose = true
        
        
        do {
            try context.save()
        } catch {
            print("Failed to save data item: \(error.localizedDescription)")
        }
    }
}

enum PointCategory {
    case relationship, training, family
}

#Preview {
    let container = try! ModelContainer(for: DataItem.self)
    let dataItem = DataItem()
    
    return DailyEvents(pointModels: dataItem, alreadyChoose: .constant(false))
        .modelContainer(container)
}
