import SwiftUI

struct ContentView: View {
    
    @State private var showMainMenu = false
    
    var body: some View {
        GeometryReader { geo in
            if showMainMenu {
                ContentView()
            } else {
                ZStack {
                    Color.main
                    HStack {
                        Text("Shuttle of Destiny")
                            .font(.custom("PressStart2P-Regular", size: geo.size.height * Constants.titleSize))
                            .multilineTextAlignment(.center)
                        
                        
                        Spacer()
                            .frame(width: geo.size.width * Constants.mediumGapSize, height: geo.size.height * Constants.mediumGapSize)
                        
                        VStack {
                            Button {
                                Helper.sharedHelper.playClickSfx()
                            } label: {
                                Text("Start Game")
                                    .font(.custom("PressStart2P-Regular", size: geo.size.height * Constants.textSize))
                            }
                            .padding(geo.size.height * Constants.smallGapSize)
                            .background(Color.secondary)
                            .clipShape(.capsule)
                            
                            Button {
                                Helper.sharedHelper.playClickSfx()
                            } label: {
                                Text("Exit")
                                    .font(.custom("PressStart2P-Regular", size: geo.size.height * Constants.textSize))
                            }
                            .padding(geo.size.height * Constants.smallGapSize)
                            .background(Color.secondary)
                            .clipShape(.capsule)
                        }
                        .tint(Color.white)
                    }
                    .padding(.horizontal, geo.size.width * Constants.smallGapSize)
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .onAppear {
            Helper.sharedHelper.playMenuMusic()
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
