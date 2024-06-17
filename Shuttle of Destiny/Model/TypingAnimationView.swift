import SwiftUI

struct TypingAnimationView: View {
    @State var conversation_index = 1
    let conversation_1_alex = "Dad, look! I got it!"
    let conversation_2_dad = "I'm so proud of you, my son"
    @State private var animatedText: String = ""

    var body: some View {
        HStack{
            VStack (alignment: .leading){
                Text(animatedText)
                    .font(.title)
                    .padding()
                
                // Choice Button
                if conversation_index > 2 {
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 160, height: 120)
                            .cornerRadius(50)
                            .foregroundColor(.blue)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Rectangle()
                            .frame(width: 160, height: 120)
                            .cornerRadius(50)
                            .foregroundColor(.blue)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }
                }
            }
            Spacer()
        }
        .onAppear {
            switch conversation_index {
            case 1:
                animateText(text: conversation_1_alex)
            case 2:
                animateText(text: conversation_2_dad)
            default:
                animateText(text: "Error!")
            }
        }
    }

    func animateText(text: String) {
        for (index, character) in text.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                animatedText.append(character)
                // You can add haptic feedback to support typing animation.(optional)
//                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            if animatedText == text {
                conversation_index += 1
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
