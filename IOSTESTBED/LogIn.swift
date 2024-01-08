//
//  LogIn.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/05.
//

import SwiftUI

struct LogIn: View {
        @State private var username = ""
        @State private var password = ""
        //@State private var isLoggedIn = false
        @State private var isAutoSaveEnabled = false
        
        @State private var showContentView = false
    
    var body: some View {
        Image("login") // Set your image name here
               .resizable()
               .scaledToFill()
               .edgesIgnoringSafeArea(.all)
               .overlay(
                  VStack {
                    Spacer()
                    
                    Text("조립 TEST BED\n스케줄 시스템")
                        .font(Font.title.bold())
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .lineSpacing(8)
                    
                    
                      TextField("ID", text: $username)
                          //.padding()
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .autocapitalization(.none)
                      
                      SecureField("Password", text: $password)
                          //.padding()
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                      
                      Toggle("자동저장", isOn: $isAutoSaveEnabled)
                          //.padding()
                      
                      Button(action: {
                          //print("Username: \(username), Password: \(password), Auto Save: \(isAutoSaveEnabled)")
                        
                        showContentView.toggle()
                        
                      }) {
                          Text("로그인")
                              .fontWeight(.semibold)
                              .foregroundColor(.white)
                              .frame(minWidth: 0, maxWidth: .infinity)
                              .padding()
                              .background(Color.blue)
                              .cornerRadius(4)
                                                
                      }
                      .fullScreenCover(isPresented: $showContentView, content: ContentView.init)
                    Spacer()
                    
                    Spacer()
    //                Image("main")
    //                    .resizable()
    //                    .frame(width: .infinity, height: 200)
                    //
                                
                    Text("Version : 1.0")
                        .multilineTextAlignment(.leading)
                        .font(.footnote)
                        .foregroundColor(.black)
                  }
                  .padding()
               )
        
          }
       
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}





//        VStack {
//                    Text("Login")
//                        .font(.largeTitle)
//                        .padding()
//
//                    TextField("Username", text: $username)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//
//                    SecureField("Password", text: $password)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//
//                    NavigationLink(destination: SessionView(userId: $username, roomNo: $password)) {
//                                       Text("입장")
//                                   }
//                                   .frame(width: 200, height: 20)
//                                    //.buttonStyle(Color.red)
//                                   .foregroundColor(Color.blue)
//                                   .padding()
//                                   .background(Color("#243062"))
//                                   .cornerRadius(10)
//
//                    Button(action: {
//                        //ContentView()
//                        // Simulate login process
//                        //if username == "user" && password == "password" {
//                        //    isLoggedIn = true
//                        //}
//                    }) {
//                        Text("Login")
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(Color.blue)
//                            .cornerRadius(8)
//                    }
//
//                    if isLoggedIn {
//                        Text("Logged in as \(username)")
//                            .padding()
//                    }
//
//
//
//        }
//        .padding()
//    }
