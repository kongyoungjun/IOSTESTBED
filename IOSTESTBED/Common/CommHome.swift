//
//  CommHome.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/17.
//

import SwiftUI

struct CommHome: View {
    @State private var isActive: Bool = false
    @State private var isShowingPop: Bool = false
    @State private var isShowingPopup: Bool = false
    var body: some View {
        VStack()
        {
            HStack{
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
                
                Button(action: {isShowingPop = true})
                {
                           VStack {
                               Image("iconship")
                               Text("호선정보조회").font(.system(size:12))
                           }
                           .frame(width: 70, height: 60)
                           .padding()
                           .foregroundColor(.black)
                           .background(Color.blue)
                           
                }.fullScreenCover(isPresented: $isShowingPop) {
                    CommonPower(isPresented: $isShowingPop)
                }
                
                Button(action: {isShowingPopup = true})
                {
                           VStack {
                               Image("iconship")
                               Text("호선정보조회").font(.system(size:12))
                           }
                           .frame(width: 70, height: 60)
                           .padding()
                           .foregroundColor(.black)
                           .background(Color.blue)
                           
                }
                .fullScreenCover(isPresented: $isShowingPopup) {
                    WorkerList(isPresented: $isShowingPopup)
                }
            }
            
        }
    }
}

struct CommHome_Previews: PreviewProvider {
    static var previews: some View {
        CommHome()
    }
}
