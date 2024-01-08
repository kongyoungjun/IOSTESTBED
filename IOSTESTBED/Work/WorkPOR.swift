
import SwiftUI



extension View {
    func statusBarStyle(_ style: UIStatusBarStyle) -> some View {
        self.modifier(StatusBarStyleModifier(style: style))
    }
}

struct StatusBarStyleModifier: ViewModifier {
    var style: UIStatusBarStyle

    func body(content: Content) -> some View {
        content
            .onAppear {
                let viewController = UIViewController()
                viewController.overrideUserInterfaceStyle = .light
                viewController.setNeedsStatusBarAppearanceUpdate()
                //viewController.preferredStatusBarStyle = style
            }
    }
}

struct WorkPOR: View {
    @Binding var isPresented: Bool
   // @State private var isPresented = true

    var body: some View {
        VStack {
            Text("This is a Popup View")
                .statusBarStyle(.darkContent)
                .font(.title)
                .padding()
Spacer()
            Button(action: {
                // Action to dismiss the popup view
                isPresented = false
            }) {
                Text("Close")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
    
}

struct WorkPOR_Previews: PreviewProvider {
    static var previews: some View {
       // WorkPOR(isPresented: Binding<Bool>)
        WorkPOR(isPresented: Binding.constant(false))
        
    }
}
