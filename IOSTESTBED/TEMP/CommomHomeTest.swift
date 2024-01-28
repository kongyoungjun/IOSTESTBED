//
//  CommomHomeTest.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/09.
//

import SwiftUI

struct CommomHomeTest: View {
    
    @State private var isPresentingFullScreen = false
    
    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink("Show Fullscreen Cover", destination:
                            Text("Destination View")
                                .fullScreenCover(isPresented: $isPresentingFullScreen, content: {
                                    FullScreenCoverView1(isPresented: $isPresentingFullScreen)
                                })
                        )
                        .padding()
                    }
                    .navigationTitle("Main View")
        }
    }
}


struct FullScreenCoverView1: View {
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

struct CommomHomeTest_Previews: PreviewProvider {
    static var previews: some View {
        CommomHomeTest()
    }
}
