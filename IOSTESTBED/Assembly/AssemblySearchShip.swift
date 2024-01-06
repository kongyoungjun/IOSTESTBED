//
//  AssemblySearchShip.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/07.
//

import SwiftUI

struct AssemblySearchShip: View {
    //@Binding var isPresented: Bool
     //   @Environment(\.presentationMode) var presentationMode

        var body: some View {
            ZStack {
                Color.gray.edgesIgnoringSafeArea(.all)

                VStack {
                    Text("This is a full-screen view!")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()

                    Spacer()

                    Button(action: {
                        //presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.bottom)
                }
            }
        }
}

struct AssemblySearchShip_Previews: PreviewProvider {
    static var previews: some View {
        AssemblySearchShip()
    }
}
