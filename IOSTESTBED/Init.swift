//
//  Init.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/06.
//

import SwiftUI

struct Init: View {
    var body: some View {
        NavigationView {
                 VStack {
                     NavigationLink(destination: LogIn()) {
                         Text("Go to Second View")
                             .padding()
                             .foregroundColor(.white)
                             .background(Color.blue)
                             .cornerRadius(10)
                     }
                 }
                // .navigationBarTitle("First View")
             }
    }
}

struct Init_Previews: PreviewProvider {
    static var previews: some View {
        Init()
    }
}
