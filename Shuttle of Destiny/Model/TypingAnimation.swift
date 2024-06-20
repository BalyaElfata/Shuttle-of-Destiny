import SwiftUI
import Foundation

func animateText(text: String) {
    for (index, character) in text.enumerated() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.11) {
            animatedText.append(character)
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        }
    }
}
