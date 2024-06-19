import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear()
        //test
    }
}

#Preview {
    ContentView()
}
