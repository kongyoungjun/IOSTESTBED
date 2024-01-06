
import SwiftUI

struct AssemblyHome: View {
   // @State private var isActiveShip: Bool = false
    @State private var showNewScreen: Bool = false
    
    var body: some View {
        VStack {
                    Button(action: {
                        showNewScreen.toggle()
                    }) {
                        Text("Present Full Screen")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .fullScreenCover(isPresented: $showNewScreen, content: {
                        AssemblySearchShip()
                    })
                }
    }
}

struct AssemblyHome_Previews: PreviewProvider {
    static var previews: some View {
        AssemblyHome()
    }
}
