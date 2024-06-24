import SwiftUI
import SwiftData

struct DailyEvents: View {
    
    @EnvironmentObject private var gameplay: GameplayViewModel
    var suddenEvent = GameplayViewModel()
    var pointModels: DataItem
    @Environment(\.modelContext) private var context
    @Binding var alreadyChoose: Bool
    @Binding var suddenDays: Bool
    
    var body: some View {
        GeometryReader { geo in
            
            Image("room_day")
                .resizable()
                .scaledToFill()
            
            VStack {
                Text("What should I do?")
                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.largeTextSize))
                    .shadow(color: .black, radius: 15)
                    .multilineTextAlignment(.center)
                    
                
                Spacer().frame(height: geo.size.height * Constants.smallGapSize)
                
                HStack {
                    ZStack {
                        
                        Button(action: {
                            updatePoints(for: .relationship)
                        }) {
                            Image("love_button")
                        }
                    }
                    
                    Spacer().frame(width: 80.0, height: 0.0)
                    
                    ZStack {
                        
                        Button(action: {
                            updatePoints(for: .training)
                        }) {
                            Image("train_button")
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
                            Image("family_button")
                        }
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .padding()
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
    }
    
    private func updatePoints(for category: PointCategory) {
        switch category {
        case .relationship:
            pointModels.ChoiceID = 1
            
            if pointModels.SuddenDays.contains(pointModels.Days) {
                suddenDays = true
                
            } else {
                pointModels.RelationPoint += 1
                
            }
        
        case .training:
            pointModels.ChoiceID = 2
            
            if pointModels.SuddenDays.contains(pointModels.Days) {
                suddenDays = true
                
            } else {
                pointModels.TrainingPoint += 1
                
            }
            
            
        case .family:
            pointModels.ChoiceID = 3
            
            if pointModels.SuddenDays.contains(pointModels.Days) {
                suddenDays = true
                
            } else {
                pointModels.FamilyPoint += 1
                
            }
            
            
            
        }
        
        
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
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    let dataItem = DataItem()
    
    return DailyEvents(pointModels: dataItem, alreadyChoose: .constant(false), suddenDays: .constant(false))
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(GameplayViewModel())
}
