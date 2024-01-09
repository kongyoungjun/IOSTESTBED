//
//  WorkerListPopup.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/10.
//

import SwiftUI

struct WorkerListPopup: View {
    @Binding var isPresented: Bool
    @Binding var state: Int
    
    var body: some View {
        VStack {
            Text("This is a Popup")
                .font(.title)
                .padding()
            
            Button("Close") {
                isPresented = false // Close the popup when tapped
            }
            .padding()
        }
        .background(Color.white)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct WorkerListPopup_Previews: PreviewProvider {
    static var previews: some View {
        //WorkerListPopup()
        
        WorkerListPopup(isPresented: Binding.constant(false), state: Binding.constant(0))
    }
}
