import SwiftUI
import Foundation

struct PrologView: View {
    @State var conversationIndex = 0
    var conversationList: [String] = []
    var alexConversation: [String] = []
    var dadConversation: [String] = []
    var miaConversation: [String] = []
    var coachConversation: [String] = []
    var doctorConversation: [String] = []
    let blackScreen = "  "
    let noConversation = " "
    let conversation1Alex = "Dad, look! I got it!"
    let conversation2Dad = "I'm so proud of you, my son"
    let conversation3Dad = "You know, Alex, every time I see you on that court, it's like watching a part of myself out there."
    let conversation4Alex = "I learned from the best, Dad. You've always been my biggest inspiration."
    let conversation5Dad = "I just wish I could've been the world champion. But you... you have the chance to achieve what I couldn't."
    let conversation6Alex = "And I will, Dad. I'll make sure your dream comes true."
    let conversation7Coach = "Alex, you need to focus more. Your rival, Marcus, is training twice as hard. He’s hungry for that championship title."
    let conversation8Alex = "I know, Coach. But with my dad's condition and everything else, it’s tough."
    let conversation9Coach = "I understand, Alex. But this is your dream too. You have to push through these challenges."
    let conversation10Alex = "You’re right. I’ll do my best."
    let conversation11Mia = "I can’t believe how much you’ve improved since we first met. Your dedication is incredible."
    let conversation12Alex = "Thanks, Mia. Having you by my side makes all the difference."
    let conversation13Mia = "I’m always here for you, Alex. I know how much this championship means to you and your dad."
    let conversation14Alex = "You’ve been my rock. I don’t know what I’d do without you."
    let conversation15Mia = "We’re a team, remember? I believe in you."
    let conversation16Doctor = "John's condition is deteriorating. He needs to avoid stress and take his medication regularly. I suggest he stays in the hospital for better monitoring and care."
    let conversation17Alex = "Is there anything else we can do?"
    let conversation18Doctor = "Ensuring he's comfortable and reducing any additional strain on his heart is crucial."
    let conversation19John = "Don't worry about me, son. Focus on your training. The championship is what matters now."
    let conversation20Alex = "I’ll take care of you, Dad. And I'll win that championship for both of us."
    let conversation21Dad = "I know you will, Alex. You’ve always made me proud."
    let conversation22Mia = "Hey, how are you holding up?"
    let conversation23Alex = "It’s been a long day, but I’m managing. How about you?"
    let conversation24Mia = "I’m good. Just wanted to check in and remind you that you’re amazing. I believe in you."
    let conversation25Alex = "Thanks, Mia. Your support means the world to me."
    let conversation26Mia = "Anytime, Alex. Get some rest. Tomorrow’s another big day."
    let conversation27Alex = "I won’t let you down, Dad. I’ll make your dream a reality."
    
    @State var sceneNumber = 1
    
    @State private var showDailyPlayView = false
    
//    @State private var animatedText: String = ""
    
    init() {
        // Conversation list
        conversationList = [
            noConversation,
            conversation1Alex,
            conversation2Dad,
            blackScreen,
            conversation3Dad,
            conversation4Alex,
            conversation5Dad,
            conversation6Alex,
            blackScreen,
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
    
        alexConversation = [
            conversation1Alex,
            conversation4Alex,
            conversation6Alex,
            conversation8Alex,
            conversation10Alex,
            conversation12Alex,
            conversation14Alex,
            conversation17Alex,
            conversation20Alex,
            conversation23Alex,
            conversation25Alex,
            conversation27Alex,
        ]
        
        dadConversation = [
            conversation2Dad,
            conversation3Dad,
            conversation5Dad,
            conversation21Dad,
        ]
        
        miaConversation = [
            conversation11Mia,
            conversation13Mia,
            conversation15Mia,
            conversation22Mia,
            conversation24Mia,
            conversation26Mia,
        ]
        
        coachConversation = [
            conversation7Coach,
            conversation9Coach,
        ]
        
        doctorConversation = [
            conversation16Doctor,
            conversation18Doctor,
        ]
    }

    var body: some View {
        if showDailyPlayView {
            EventView()
        } else {
            GeometryReader { geo in
                ZStack {
                    switch sceneNumber {
                    case 1:
                        Image("prolog1")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 2:
                        Image("prolog2")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 3:
                        Image("prolog3")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 4:
                        Image("prolog4")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 5:
                        Image("prolog5")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 6:
                        Image("prolog6")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 7:
                        Image("prolog7")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 8:
                        Image("prolog8")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 9:
                        Image("prolog9")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 10:
                        Image("prolog10")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 11:
                        Image("prolog11")
                            .resizable()
                            .ignoresSafeArea(.all)
                    case 12:
                        Color.black
                            .ignoresSafeArea(.all)
                    default:
                        Image("park")
                            .resizable()
                            .ignoresSafeArea(.all)
                    }
                    if alexConversation.contains(conversationList[conversationIndex]) {
                        Image("MC Sprite")
                            .resizable()
                            .frame(width: 222, height: 231)
                            .position(x: 80, y:200)
                            .opacity(0.9)
                    }
                    else if dadConversation.contains(conversationList[conversationIndex]) {
                        Image("Dad Sprite")
                            .resizable()
                            .frame(width: 240, height: 240)
                            .position(x: 680, y:220)
                            .opacity(0.9)
                    }
                    else if miaConversation.contains(conversationList[conversationIndex]) {
                        Image("Mia Sprite")
                            .resizable()
                            .frame(width: 240, height: 240)
                            .position(x: 680, y:220)
                            .opacity(0.9)
                    }
                    VStack (){
                        Spacer()
                        ZStack {
                            Image("Chat Box")
                                .opacity(conversationList[conversationIndex] == blackScreen || conversationList[conversationIndex] == noConversation ? 0 : 0.9)
                                .overlay(alignment: .leading){
                                    Text(conversationList[conversationIndex])
                                        .foregroundStyle(.black)
                                        .font(.custom(Constants.vtFont, size: geo.size.width * Constants.smallTextSize))
                                        .padding(.horizontal, 50)
                                        .padding(.vertical, 15)
                                }
                        }
                    }
                    Color.black
                        .ignoresSafeArea(.all)
                        .opacity(conversationList[conversationIndex] == blackScreen ? 1 : 0)
                        .animation(.easeInOut(duration: 1.0))
                }
                .onTapGesture {
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
                    case 9:
                        sceneNumber = 7
                    case 14:
                        sceneNumber = 9
                    case 20:
                        sceneNumber = 10
                    case 27:
                        sceneNumber = 11
                    case 33:
                        sceneNumber = 12
                    default:
                        return
                    }
                }
                .onAppear {
                    Helper.sharedHelper.playPrologueMusic()
                }
            }
        }
    }

//    func animateText(text: String) {
//        animatedText = ""
//        for (index, character) in text.enumerated() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.11) {
//                animatedText.append(character)
//                UIImpactFeedbackGenerator(style: .light).impactOccurred()
//            }
//        }
//    }
    
    func nextConversation() {
        if conversationIndex < conversationList.count-1{
//            animateText(text: conversationList[conversationIndex])
            conversationIndex+=1
        }
        else {
            showDailyPlayView = true
        }
    }
}

struct PrologView_Previews: PreviewProvider {
    static var previews: some View {
        PrologView()
    }
}
