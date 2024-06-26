import SwiftUI
import SwiftData

struct DailyEvents: View {
    
    @EnvironmentObject private var gameplay: SuddenEventViewModel
    var suddenEvent = SuddenEventViewModel()
    var pointModels: PointModel
    @Environment(\.modelContext) private var context
    @Binding var alreadyChoose: Bool
    @Binding var suddenDays: Bool
    
    @State private var animateScreenViews = false
    
    var body: some View {
        GeometryReader { geo in
            Image("room_day")
                .resizable()
                .scaledToFill()
            if animateScreenViews {
                ZStack {
                    VStack {
                        HStack {
                            Text("DAY-\(pointModels.Days)")
                                .font(.custom(Constants.psFont, size: geo.size.width * Constants.smallTextSize))
                                .padding(.horizontal, geo.size.width * Constants.midiSmallGapSize)
                            Spacer()
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("A new day is a new day, too. \nWhat's should I do today?")
                                .font(.custom(Constants.psFont, size: geo.size.height * Constants.textSize))
                                .shadow(color: .black, radius: 15)
                                .multilineTextAlignment(.center)
                                
                            
                            Spacer().frame(height: geo.size.height * Constants.smallGapSize)
                            
                            HStack {
                                Button(action: {
                                    updatePoints(for: .relationship)
                                    
                                    Helper.sharedHelper.playClickSfx()
                                }) {
                                    Image("love_button")
                                }
                                
                                Spacer().frame(width: 80.0, height: 0.0)
                                   
                                Button(action: {
                                    updatePoints(for: .training)
                                    
                                    Helper.sharedHelper.playClickSfx()
                                }) {
                                    Image("train_button")
                                }
                                
                                Spacer().frame(width: 80.0, height: 0.0)
                                
                                Button(action: {
                                    Helper.sharedHelper.playClickSfx()
                                    updatePoints(for: .family)
                                }) {
                                    Image("family_button")
                                }
                            }
                        }
                        .frame(width: geo.size.width * Constants.boxSize, height: geo.size.height * Constants.boxSize)
                        .background {
                            RoundedRectangle(cornerRadius: 50)
                                .opacity(0.6)
                                .foregroundColor(.black)
                        }
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .onAppear {
            EndingViewModel.calculateEndingTypes(for: pointModels)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                animateScreenViews = true
            }
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
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    let dataItem = PointModel()
    
    return DailyEvents(pointModels: dataItem, alreadyChoose: .constant(false), suddenDays: .constant(false))
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(SuddenEventViewModel())
}
