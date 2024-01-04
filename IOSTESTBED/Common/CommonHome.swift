//
//  CommonHome.swift
//  IOSTESTBED
//
//  Created by KX60 on 2023/12/31.
//

import SwiftUI

struct CommonHome: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        VStack()
        {
            HStack(spacing:20) {
                      Button(action: {
                           // Action to perform when the second button is tapped
                           print("Second Button tapped!")
                       }) {
                           Text("Button 2")
                               .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)) // Custom padding
                               .foregroundColor(.white) // Set text color
                               .background(Color.green) // Set background color of the button
                               .cornerRadius(25) // Round the button corners more
                               .overlay(
                                   RoundedRectangle(cornerRadius: 25)
                                       .stroke(Color.white, lineWidth: 2) // Add a border around the button
                               )
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
                               print("First Button tapped!")
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
