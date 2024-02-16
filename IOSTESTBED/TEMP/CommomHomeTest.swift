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
        VStack {
                    Text("Tap to make a call")
                        .padding()
                        .onTapGesture {
                            if let phoneURL = URL(string: "tel://1234567890") {
                                UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                            }
                        }
                }
                .navigationTitle("Phone Dialer")
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
