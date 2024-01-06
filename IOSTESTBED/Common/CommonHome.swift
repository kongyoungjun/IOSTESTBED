//
//  CommonHome.swift
//  IOSTESTBED
//
//  Created by KX60 on 2023/12/31.
//

import SwiftUI

struct CommonHome: View {
    @State private var isActive: Bool = false
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        VStack()
        {
            HStack(spacing:20) {
                NavigationView {
                           VStack {
                               Button(action: {
                                   isActive = true
                               }) {
                                   Text("Go to Second View")
                                       .padding()
                                       .foregroundColor(.white)
                                       .background(Color.blue)
                                       .cornerRadius(10)
                               }
                               .padding()

                               NavigationLink(
                                   destination: CommonWorker(),
                                   isActive: $isActive,
                                   label: {
                                       EmptyView()
                                   }
                               )
                               .hidden()
                           }
                           .navigationBarTitle("First View")
                       }
                
                    Button(action: {
                           // Action to perform when the first button is tapped
                           print("First Button tapped!")
                       }) {
                           VStack {
                               Image("iconcar") // SF Symbol as button image
                               Text("Like")
                           }
                           .padding()
                           .foregroundColor(.white)
                           .background(Color.blue)
                           .cornerRadius(8)
                       }
                
                    Button(action: {
                               // Action to perform when the first button is tapped
                        //NavigationLink(destination: CommonWorker()) {
                            
                        
                           }) {
                               VStack {
                                   Image("iconcar")
                                   Text("Like")
                               }
                               .padding()
                               .foregroundColor(.white)
                               .background(Color.gray)
                               .cornerRadius(8)
                           }
                    
                    .padding() // Add padding around the button
            }
            
        }
    }
}

struct CommonHome_Previews: PreviewProvider {
    static var previews: some View {
        CommonHome()
    }
}
