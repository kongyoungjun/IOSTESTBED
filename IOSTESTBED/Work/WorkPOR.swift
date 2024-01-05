//
//  WorkPOR.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/05.
//

import SwiftUI


struct WorkPOR: View {
    @Binding var isPresented: Bool
   // @State private var isPresented = true

    var body: some View {
        VStack {
            Text("This is a Popup View")
                .font(.title)
                .padding()

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

//struct WorkPOR_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkPOR(isPresented: Binding<Bool>)
//    }
//}
