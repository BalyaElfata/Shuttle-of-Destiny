import SwiftUI

struct ContentView: View {
    
    @State private var animateScreenViews = false
    @State private var showPrologueForStart = false
    @State private var showCredits = false
    
    var body: some View {
        if showPrologueForStart {
            ADVView()
        } else if showCredits {
            CreditsView()
        } else {
            GeometryReader { geo in
                ZStack {
                    Color.main
                    
                    HStack {
                        if animateScreenViews {
                            HStack {
                                Text("Shuttle of Destiny")
                                    .font(.custom(Constants.psFont, size: geo.size.height * Constants.titleSize))
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                    .frame(width: geo.size.width * Constants.mediumGapSize, height: geo.size.height * Constants.mediumGapSize)
                                
                                VStack {
                                    Button {
                                        Helper.sharedHelper.playClickSfx()
                                        
                                        showPrologueForStart = true
                                    } label: {
                                        Text("Start Game")
                                            .font(.custom(Constants.psFont, size: geo.size.height * Constants.textSize))
                                    }
                                    .padding(geo.size.height * Constants.smallGapSize)
                                    .background(Color.secondary)
                                    .clipShape(.capsule)
                                    
                                    Button {
                                        Helper.sharedHelper.playClickSfx()
                                        
                                        showCredits = true
                                    } label: {
                                        Text("DRIM!")
                                            .font(.custom(Constants.psFont, size: geo.size.height * Constants.textSize))
                                    }
                                    .padding(geo.size.height * Constants.smallGapSize)
                                    .background(Color.secondary)
                                    .clipShape(.capsule)
                                }
                                .tint(Color.white)
                            }
                            .padding(.horizontal, geo.size.width * Constants.smallGapSize)
                        }
                    }
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .onAppear {
                Helper.sharedHelper.playMenuMusic()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    animateScreenViews = true
                }
            }
            .preferredColorScheme(.dark)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
