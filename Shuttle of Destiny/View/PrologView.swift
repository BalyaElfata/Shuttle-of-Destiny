import SwiftUI
import Foundation
import UIKit
import SwiftData

struct PrologView: View {
    @State var conversationIndex = 0
    @Binding var playerName: String
    
    var pointModels: PointModel
    var suddenPointModels: SuddenPointModel
    
    var conversationList: [String] = []
    let blackScreen = "  "
    let noConversation = " "
    
    @State var sceneNumber = 1
    
    @State private var showDailyPlayView = false
    
    @State private var animatedText: String = ""
    var conversation1Alex = " "
    var conversation2Dad = " "
    var conversation3Dad = " "
    var conversation4Alex = " "
    var conversation5Dad = " "
    var conversation6Alex = " "
    var conversation7Coach = " "
    var conversation8Alex = " "
    var conversation9Coach = " "
    var conversation10Alex = " "
    var conversation11Mia = " "
    var conversation12Alex = " "
    var conversation13Mia = " "
    var conversation14Alex = " "
    var conversation15Mia = " "
    var conversation16Doctor = " "
    var conversation17Alex = " "
    var conversation18Doctor = " "
    var conversation19John = " "
    var conversation20Alex = " "
    var conversation21Dad = " "
    var conversation22Mia = " "
    var conversation23Alex = " "
    var conversation24Mia = " "
    var conversation25Alex = " "
    var conversation26Mia = " "
    var conversation27Alex = " "
    
    init(playerName: Binding<String>) {
        
        pointModels = PointModel()
        suddenPointModels = SuddenPointModel()
        self._playerName = playerName
        
        pointModels.PlayerName = playerName.wrappedValue
        
        conversation1Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): Dad, look! I got it!"
        conversation2Dad = "Dad: I'm so proud of you, my son."
        conversation3Dad = "Dad: You know, \(pointModels.PlayerName.capitalizingFirstLetter()), every time I see you on that court, it's like watching a part of myself out there."
        conversation4Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): I learned from the best, Dad. You've always been my biggest inspiration."
        conversation5Dad = "Dad: I just wish I could've been the world champion. But you... you have the chance to achieve what I couldn't."
        conversation6Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): And I will, Dad. I'll make sure your dream comes true."
        conversation7Coach = "Coach: \(pointModels.PlayerName.capitalizingFirstLetter()), you need to focus more. Your rival, Marcus, is training twice as hard. He’s hungry for that championship title."
        conversation8Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): I know, Coach. But with my dad's condition and everything else, it’s tough."
        conversation9Coach = "Coach: I understand, \(pointModels.PlayerName.capitalizingFirstLetter()). But this is your dream too. You have to push through these challenges."
        conversation10Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): You’re right. I’ll do my best."
        conversation11Mia = "Mia: I can’t believe how much you’ve improved since we first met. Your dedication is incredible."
        conversation12Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): Thanks, Mia. Having you by my side makes all the difference."
        conversation13Mia = "Mia: I’m always here for you, \(pointModels.PlayerName.capitalizingFirstLetter()). I know how much this championship means to you and your dad."
        conversation14Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): You’ve been my rock. I don’t know what I’d do without you."
        conversation15Mia = "Mia: We’re a team, remember? I believe in you."
        conversation16Doctor = "Doctor: John's condition is deteriorating. He needs to avoid stress and take his medication regularly. I suggest he stays in the hospital for better monitoring and care."
        conversation17Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): Is there anything else we can do?"
        conversation18Doctor = "Doctor: Ensuring he's comfortable and reducing any additional strain on his heart is crucial."
        conversation19John = "John: Don't worry about me, son. Focus on your training. The championship is what matters now."
        conversation20Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): I’ll take care of you, Dad. And I'll win that championship for both of us."
        conversation21Dad = "Dad: I know you will, \(pointModels.PlayerName.capitalizingFirstLetter()). You’ve always made me proud."
        conversation22Mia = "Mia: Hey, how are you holding up?"
        conversation23Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): It’s been a long day, but I’m managing. How about you?"
        conversation24Mia = "Mia: I’m good. Just wanted to check in and remind you that you’re amazing. I believe in you."
        conversation25Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): Thanks, Mia. Your support means the world to me."
        conversation26Mia = "Mia: Anytime, \(pointModels.PlayerName.capitalizingFirstLetter()). Get some rest. Tomorrow’s another big day."
        conversation27Alex = "\(pointModels.PlayerName.capitalizingFirstLetter()): I won’t let you down, Dad. I’ll make your dream a reality."
        
        conversationList = [
            noConversation,
            conversation1Alex,
            conversation2Dad,
            blackScreen,
            noConversation,
            conversation3Dad,
            conversation4Alex,
            conversation5Dad,
            conversation6Alex,
            blackScreen,
            noConversation,
            noConversation,
            conversation7Coach,
            conversation8Alex,
            conversation9Coach,
            conversation10Alex,
            blackScreen,
            conversation11Mia,
            conversation12Alex,
            conversation13Mia,
            conversation14Alex,
            conversation15Mia,
            blackScreen,
            conversation16Doctor,
            conversation17Alex,
            conversation18Doctor,
            conversation19John,
            conversation20Alex,
            conversation21Dad,
            blackScreen,
            conversation22Mia,
            conversation23Alex,
            conversation24Mia,
            conversation25Alex,
            conversation26Mia,
            blackScreen,
            conversation27Alex,
        ]
    }

    var body: some View {
        if showDailyPlayView {
            HomeView(pointModels: pointModels, gamePlay: suddenPointModels)
                .environmentObject(SuddenEventViewModel())
        } else {
            GeometryReader { geo in
                ZStack {
                    ZStack {
                        switch sceneNumber {
                        case 1:
                            Image("prolog1")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 2:
                            Image("prolog2")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 3:
                            Image("prolog3")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 4:
                            Image("prolog4")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 5:
                            Image("prolog5")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 6:
                            Image("prolog6")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 7:
                            Image("prolog7")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 8:
                            Image("prolog8")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 9:
                            Image("prolog9")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 10:
                            Image("prolog10")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 11:
                            Image("prolog11")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        case 12:
                            Color.black
                                .ignoresSafeArea(.all)
                        default:
                            Image("park")
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea(.all)
                        }
                        VStack (){
                            Spacer()
                            ZStack {
                                Image("Chat Box")
                                    .opacity(conversationList[conversationIndex] == blackScreen || conversationList[conversationIndex] == noConversation ? 0 : 0.9)
                                    .frame(width: geo.size.width * Constants.boxSize, height: geo.size.height * Constants.boxSize)
                                    .overlay(alignment: .leading){
                                        Text(conversationList[conversationIndex])
                                            .foregroundStyle(.black)
                                            .font(.custom(Constants.vtFont, size: geo.size.width * Constants.smallTextSize))
                                    }
                                    .offset(y: 35)
                            }
                        }
                        VStack() {
                            HStack() {
                                Spacer()
                                    .padding(.all, geo.size.height * Constants.smallGapSize)
                                Button{
                                    Helper.sharedHelper.playClickSfx()
                                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                    showDailyPlayView = true
                                }label: {
                                    Image("Skip Button")
                                        .resizable()
                                        .frame(width: geo.size.width*0.08, height: geo.size.height*0.08)
                                }
                            }
                            Spacer()
                        }
                        Color.black
                            .ignoresSafeArea(.all)
                            .opacity(conversationList[conversationIndex] == blackScreen ? 1 : 0)
                            .animation(.easeInOut(duration: 1.0))
                    }
                    .onAppear {
                        Helper.sharedHelper.playPrologueMusic()
                    }
                }
                .onTapGesture {
                    Helper.sharedHelper.playClickSfx()
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    nextConversation()
                    switch conversationIndex {
                    case 0:
                        sceneNumber = 1
                    case 1:
                        sceneNumber = 2
                    case 4:
                        sceneNumber = 3
                    case 5:
                        sceneNumber = 4
                    case 10:
                        sceneNumber = 5
                    case 11:
                        sceneNumber = 6
                    case 12:
                        sceneNumber = 7
                    case 17:
                        sceneNumber = 9
                    case 23:
                        sceneNumber = 10
                    case 30:
                        sceneNumber = 11
                    case 36:
                        sceneNumber = 12
                    default:
                        return
                    }
                }
            }
        }
    }
    
    func nextConversation() {
        if conversationIndex < conversationList.count-1{
            conversationIndex+=1
        }
        else {
            showDailyPlayView = true
        }
    }
}

#Preview {
    let container = try! ModelContainer(for: PointModel.self)
    let container2 = try! ModelContainer(for: SuddenPointModel.self)
    
    return PrologView(playerName: .constant("Geraldo"))
        .modelContainer(container)
        .modelContainer(container2)
        .environmentObject(SuddenEventViewModel())
}
