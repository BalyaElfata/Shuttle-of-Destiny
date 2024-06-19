import SwiftUI
import Foundation

struct TypingAnimationView: View {
    @State var conversation_index = 0
    var conversation_list: [String] = []
    let conversation_1_alex = "Dad, look! I got it!"
    let conversation_2_dad = "I'm so proud of you, my son"
    
    @State private var animatedText: String = ""
    
    init() {
        // Conversation list
        conversation_list = [
            conversation_1_alex,
            conversation_2_dad,
        ]
    }

    var body: some View {
        VStack (){
            Image("park")
                .resizable()
                .ignoresSafeArea(.all)
            
            Text(animatedText)
                .font(.title)
                .padding()
        }
        .onTapGesture {
            if conversation_index < conversation_list.count{
                animateText(text: conversation_list[conversation_index])
                conversation_index+=1
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
        conversation_index+=1
    }
}

struct TypingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TypingAnimationView()
    }
}
