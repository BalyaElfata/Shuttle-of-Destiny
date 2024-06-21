import SwiftUI
import SwiftData

struct DailyEvents: View {
    
    var pointModels: DataItem
    @Environment(\.modelContext) private var context
    @ObservedObject var viewModel: GameplayViewModel()
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
            pointModels.ChoiceID = 1
            
            if pointModels.SuddenDays.contains(pointModels.Days) {
                SuddenEventListView(viewModel: GameplayViewModel, pointModels: pointModels)
            } else {
                pointModels.RelationPoint += 1
                
            }
        
        case .training:
            pointModels.TrainingPoint += 1
            pointModels.ChoiceID = 2
            
            
            
        case .family:
            pointModels.FamilyPoint += 1
            pointModels.ChoiceID = 3
            
            
            
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
    let container2 = try! ModelContainer(for: DataItem.self)
    let dataItem = DataItem()
    
    let event = [
        Gameplay(SuddenEventTitles: ["Sudden Title"], SuddenEventDescs: ["Sudden Event Description"], SuddenPointPluses: [1], SuddenPointMinuses: [1], SuddenPointPlusesOther: [1], SuddenPointMinusesOther: [1], Used: false)
    ]
    
    let viewModel = GameplayViewModel()
            viewModel.gameplays = event
    
    return DailyEvents(pointModels: dataItem, viewModel: viewModel, alreadyChoose: .constant(false))
        .modelContainer(container).modelContainer(container2)
}
