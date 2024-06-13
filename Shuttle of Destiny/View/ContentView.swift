import SwiftUI

struct ContentView: View {
    
    @State private var showMainMenu = false
    
    var body: some View {
        GeometryReader { geo in
            if showMainMenu {
                ContentView()
            } else {
                ZStack {
                    
                    VStack {
                        Text("Shuttle of Destiny")
                            .font(.custom(Constants.psFont, size: geo.size.height * Constants.titleSize))
                            .f
                    }
                    
                }
            }
        }
        .frame(width: geo.size.width, height: geo.size.height)
    }
}

#Preview {
    ContentView()
}
