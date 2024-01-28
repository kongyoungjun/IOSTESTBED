//
//  CommonPower.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/09.
//

import SwiftUI

struct CommonPower: View {
    @Binding var isPresented: Bool
    @State private var isPresentingFullScreen = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink("Go to Details", destination: DetailView())
                    .padding()
            }
            .navigationTitle("Main View")
        }
//        Button(action: {
//            // Action to dismiss the popup view
//            isPresented = false
//        }) {
//            Text("Close")
//                .padding()
//                .foregroundColor(.white)
//                .background(Color.blue)
//                .cornerRadius(8)
//        }
        
//        Button("Show Fullscreen Cover") {
//                   isPresentingFullScreen.toggle()
//               }
//               .fullScreenCover(isPresented: $isPresentingFullScreen, content: {
//                   FullScreenCoverView(isPresented: $isPresentingFullScreen)
//               })
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")
                .padding()
            
            Spacer()
        }
        .navigationTitle("Detail")
    }
}

struct FullScreenCoverView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Text("This is a Fullscreen Cover")
                .font(.title)
                .padding()
            
            Button("Dismiss") {
                isPresented.toggle()
            }
            .padding()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct CommonPower_Previews: PreviewProvider {
    static var previews: some View {
        CommonPower(isPresented: Binding.constant(false))
        //CommonPower()
    }
}
