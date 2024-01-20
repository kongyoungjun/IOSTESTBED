//
//  PopUpShipNo.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/20.
//

import SwiftUI

struct PopUpShipNo: View {
    @Binding var isPresented: Bool
    @Binding var state: Int
    @Binding var textInput: String
    
    @State private var selectedOption = 0
    @State private var textShip: String = ""

    let options = ["호선번호","공사번호","공사명"]
    
    var body: some View {
        
        VStack (alignment:.leading,  spacing: 3)
        {
            Button(action: {
                isPresented = false
            }) {
                Text("< Back").frame(height: 15)
                    
                      //  .ignoresSafeArea()
            }
            Spacer()
            
            Text(" 호선조회").font(.pretendardBold24)
            
            Divider()
            
            HStack {
                Text(" 공사번호:").font(.pretendardBold14)
                
                Spacer()
                VStack
                {
                    Picker("검색조건", selection: $selectedOption) {
                        ForEach(0..<options.count) {
                            index in Text(options[index]).tag(index)
                        }
                    }
                    //.pickerStyle(DefaultPickerStyle())
                    //.clipped()
                    .frame(width:100)
                    .clipped()
                   // Spacer()
                }
                Spacer()
                
                TextField("호선번호", text: $textShip)
                                .font(.pretendardBold14)
                Button(action: {
                    //isBigEngine = false
                }) {
                    Image("iconsearch")
                        .padding(6)
                        .background(Color.blue)
                }
            }
            
            Spacer()
            Spacer()
        }
        
//        VStack {
//            Text("This is a Popup")
//                .font(.title)
//                .padding()
//
//            Button("Close HI") {
//                textInput = "HI"
//                isPresented = false // Close the popup when tapped
//            }
//            .padding()
//        }
//        .background(Color.white)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct PopUpShipNo_Previews: PreviewProvider {
    static var previews: some View {
        PopUpShipNo(isPresented: Binding.constant(false), state: Binding.constant(0), textInput: Binding.constant(""))
    }
}
