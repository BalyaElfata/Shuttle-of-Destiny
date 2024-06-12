import SwiftUI

struct TypingAnimationView: View {
    let conversation_1_alex = "Dad, look! I got it!"
    let conversation_2_dad = "I'm so proud of you, my son!"
    @State private var animatedText: String = ""

    var body: some View {
        VStack {
            Text(animatedText)
                .font(.title)
                .padding()

        }
        .onAppear {
            animateText()
        }
    }

    func animateText() {
        for (index, character) in conversation_1_alex.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                animatedText.append(character)
// You can add haptic feedback to support typing animation.(optional)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
}

struct TypingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        TypingAnimationView()
    }
}
