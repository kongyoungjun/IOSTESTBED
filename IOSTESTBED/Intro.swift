//
//  Intro.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/08.
//

import SwiftUI

struct Intro: View {
    
    @State private var showNextView = false
    
    var body: some View {
    Image("intro") // Set your image name here
        .resizable()
        .scaledToFill()
        .edgesIgnoringSafeArea(.all)
        .overlay(
            VStack {
                Text("조립 TEST BED\n스케줄 시스템")
                    .font(Font.title.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(10)
                
                           // .font(.largeTitle)
                           // .fontWeight(.bold)

//                        Text("Get started by exploring the amazing features!")
//                            .font(.headline)
//                            .foregroundColor(.gray)
//                            .padding()
//
//                        Button(action: {
//                            showNextView.toggle()
//                        }) {
//                            Text("Get Started")
//                                .fontWeight(.semibold)
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(Color.blue)
//                                .cornerRadius(8)
//                        }
//                        .padding()
                    }
                    .fullScreenCover(isPresented: $showNextView, content: LogIn.init)
                    .onAppear {
                        // Using a timer to change the view after 2 seconds
                        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                            showNextView = true
                        }
                    }
        )
    }
}


struct Intro_Previews: PreviewProvider {
    static var previews: some View {
        Intro()
    }
}
