//
//  WorkHome.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/04.
//

import SwiftUI

struct WorkHome: View {
    
   
    
    var body: some View {
        let colorbutton : UIColor? = UIColor(named:"ColorButton")
           VStack {
                   HStack {
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
                       
                   }
                    HStack {
                        ForEach(0..<3) { column in
                            Text("\(1)")
                                .border(Color.black)
                        }
                    }
                    HStack {
                        
                        
                        Button(action: {
                                   // Action to perform when the first button is tapped
                            //self.background(Color.Red)
                                print("First Button tapped!")
                                    
                               }) {
                                   VStack {
                                       Image("iconcar")
                                       Text("Like")
                                   }
                                   .padding()
                                   .foregroundColor(.white)
                                   .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.blue, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(UIColor.blue)))
                                    )
                               }
                    
                }
             }
           .padding()
       }}

struct WorkHome_Previews: PreviewProvider {
    static var previews: some View {
        WorkHome()
    }
}
