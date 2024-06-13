import SwiftUI
import Foundation

struct TypingAnimationView: View {
    @State var conversation_index = 1
    let conversation_1_alex = "Dad, look! I got it!"
    let conversation_2_dad = "I'm so proud of you, my son"
    @State var isConversationCompleted: Bool = False
//    let conversation_list = [conversation_1_alex, conversation_2_dad]
//    let question = "Do you want to accompany Mia?"
    @State private var animatedText: String = ""

    var body: some View {
        VStack (){
            Spacer()
            Image("park")
                .resizable()
//                    .scaledToFill()
                .ignoresSafeArea(.all)
//                // Choice Button
//                if conversation_index > 2 {
//                    HStack {
//                        Spacer()
//                        Rectangle()
//                            .frame(width: 160, height: 90)
//                            .cornerRadius(50)
//                            .foregroundColor(.blue)
//                            .shadow(radius: 4)
//                            .overlay(Text("YES"))
//                        Spacer()
//                        Rectangle()
//                            .frame(width: 160, height: 90)
//                            .cornerRadius(50)
//                            .foregroundColor(.blue)
//                            .shadow(radius: 4)
//                            .overlay(Text("NO"))
//                        Spacer()
//                    }
//                }
            
            // Conversation
            Text(animatedText)
                .font(.title)
                .padding()
        }
        .onTapGesture {
            // next conversation
            animatedText = ""
            
            conversation_index+=1
            switch conversation_index {
            case 1:
                animateText(text: conversation_1_alex)
            case 2:
                animateText(text: conversation_2_dad)
            default:
                animateText(text: "Conversation is done.")
            }
    
        }
        .onAppear {
            animateText(text: conversation_1_alex)
        }
    }

    func animateText(text: String) {
        for (index, character) in text.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                animatedText.append(character)
                // You can add haptic feedback to support typing animation.(optional)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
    
    func nextConversation() {
        conversation_index += 1
    }
}

struct TypingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TypingAnimationView()
    }
}
