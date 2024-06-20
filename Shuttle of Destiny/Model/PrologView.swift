import SwiftUI
import Foundation

struct PrologView: View {
    @State var conversationIndex = 0
    var conversationList: [String] = []
    let conversation1Alex = "Dad, look! I got it!"
    let conversation2Dad = "I'm so proud of you, my son"
    let noConversation = " "
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
    
    @State var fadeToBlack = false
    
    @State private var animatedText: String = ""
    
    init() {
        // Conversation list
        conversationList = [
            conversation1Alex,
            conversation2Dad,
            noConversation,
            conversation3Dad,
            conversation4Alex,
            conversation5Dad,
            conversation6Alex,
            noConversation,
            conversation7Coach,
            conversation8Alex,
            conversation9Coach,
            conversation10Alex,
            noConversation,
            conversation11Mia,
            conversation12Alex,
            conversation13Mia,
            conversation14Alex,
            conversation15Mia,
            noConversation,
            conversation16Doctor,
            conversation17Alex,
            conversation18Doctor,
            conversation19John,
            conversation20Alex,
            conversation21Dad,
            noConversation,
            conversation22Mia,
            conversation23Alex,
            conversation24Mia,
            conversation25Alex,
            conversation26Mia,
            noConversation,
            conversation27Alex,
        ]
    }

    var body: some View {
        ZStack {
            VStack (){
                Image("park")
                    .resizable()
                    .ignoresSafeArea(.all)
                
                Text(animatedText)
                    .font(.title)
                    .padding()
            }
            Color.black
                .ignoresSafeArea(.all)
                .opacity(animatedText == " " ? 1 : 0)
                .animation(.easeInOut(duration: 1.0))
        }
        .onTapGesture {
            if conversationIndex < conversationList.count{
                animateText(text: conversationList[conversationIndex])
                conversationIndex+=1
            }
            else {
                animateText(text: "Conversation is Completed")
            }
        }
    }

    func animateText(text: String) {
        animatedText = ""
        for (index, character) in text.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.11) {
                animatedText.append(character)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
    
    func nextConversation() {
        conversationIndex+=1
    }
}

struct TypingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TypingAnimationView()
    }
}
