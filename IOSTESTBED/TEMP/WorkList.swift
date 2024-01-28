//
//  WorkList.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/16.
//

import SwiftUI

struct WorkList: View {
    @State private var items = [SampleItem]() // Array to hold decoded items
    @State private var isDataLoaded = false
    @State private var isShowingPopup = false
    @State private var textInput: String = ""
    @State var state: Int  = 0;
    
    @Binding var isPresented: Bool
    var body: some View {
        VStack (alignment:.leading)
        {
            Button(action: {
                isPresented = false
            }) {
                Text("< Back")
                    .frame(height: 30)
            }
            
            HStack
            {
                Text("TEST:")
                TextField("Enter text", text: $textInput)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()
                               .frame(width: 200)
            }
            
            
            
            
            Button("Load Popup Data") {
                isShowingPopup.toggle()
            }
            .sheet(isPresented: $isShowingPopup, content: {
                PopUpShipNo(isPresented: $isShowingPopup, state: $state , textInput: $textInput)
                    //.frame(width: .infinity - 100, height: .infinity - 150)
                        })
            
            NavigationView {
                        VStack {
                            List(items) { item in
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .navigationTitle("Custom List")
                    }
        }
       
    }
}
        
    

struct WorkList_Previews: PreviewProvider {
    static var previews: some View {
        WorkList(isPresented: Binding.constant(false))
    }
}
