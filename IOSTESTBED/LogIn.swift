//
//  LogIn.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/05.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var loginId: String
    
    init (loginIDNew : String) {
        self.loginId = loginIDNew
    }
}

struct LogIn: View {
    
       // @ObservedObject var userDataLogin : UserData
        
        @State private var logininfo: ModelLogin?
        @State private var enteredID : String = ""
        @State private var password : String  = ""
        //@State private var isLoggedIn = false
        @State private var isAutoSaveEnabled = false
        
        @State private var showContentView = false
    
        //@State private var userNameRes = ""
    
    
        @State private var isLoading: Bool = false
    
    init () {
        //self.userDataLogin = userDataLogin
    }
    
    
    var body: some View {
        Image("login") // Set your image name here
               .resizable()
               .scaledToFill()
               .edgesIgnoringSafeArea(.all)
               .overlay(
                HStack {
                    Spacer()
                    
                    VStack (alignment:.center, spacing: 1) {
                      Spacer()
                      
                      Text("조립 TEST BED\n스케줄 시스템")
                          .font(Font.title.bold())
                          .foregroundColor(.black)
                          .multilineTextAlignment(.center)
                          .lineSpacing(8)
                        
                      
                        TextField("ID", text: $enteredID)
                           // .padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                            //.padding()
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Toggle("자동저장", isOn: $isAutoSaveEnabled)
                            .padding()
                        
                        Button(action: {
                            //print("Username: \(username), Password: \(password), Auto Save: \(isAutoSaveEnabled)")
                           // userDataLogin.loginId = enteredID
                            var textResult : String = loadData(from: "", to: password)
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
                        .fullScreenCover(isPresented: $showContentView) {
                            ContentView()
                            //ContentView(userShowingName: $enteredID)
                            //NavigationLink("Go to Another View", destination:  ContentView())
                            //NavigationLink("Go to Profile", destination: )
                            //ContentView(userData: userData)
                        }
                       // .fullScreenCover(isPresented: $showContentView, content: ContentView.init)
                      //  .fullScreenCover(isPresented: $showContentView, content: ContentView.init)
                        
                      //  .fullScreenCover(isPresented: $showContentView, content :
                      //  {
                      //      ContentView(userName: $userName)
                      //  })
                            //if let person = $userName.wrappedValue {
                                
                                
                                //            .sheet(isPresented: $isShowingPopup, content: {
                                //                WorkerListPopup(isPresented: $isShowingPopup, state: $state)
                                //                                //.frame(width: 300, height: 100)
                                //                        })
                       // }
                        
                      Spacer()
                      Spacer()
                      Spacer()
                       
                                  
                      Text("Version : 1.0")
                            .frame(minWidth:0, maxWidth: 300, minHeight: 10, maxHeight: 30 , alignment: .leading)
                          //.multilineTextAlignment(.leading)
                          .font(.footnote)
                          .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                  
                  .padding()
                  //.frame(minWidth:0, maxWidth: (.infinity - 300), minHeight: 10, maxHeight: .infinity)
               )
        
          }
    
    
    private func loadData(from userid : String, to userpassword : String) -> String {
        //print("nav")
        isLoading = true
        
        guard let url = URL(string: "https://m-engine.hhi.co.kr/mengine/testbed/login.jsp?userid=A372897&userpw=pppark7230&lat=0.0&lng=0.0&network=&model=IPHONE") else {
            //print("nav1")
            //return
            return "ERROR"
        }
        //print("Error decoding JSON")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer {
                DispatchQueue.main.async {
                    isLoading = false
                }
            }
            
            guard let data = data, error == nil else {
                        return
                    }

            do {
                
                    let decodedData = try JSONDecoder().decode(ModelLogin.self, from: data)
                        logininfo = decodedData
                
                
//                                    if let workerList = decodedData["List"] {
//                                        DispatchQueue.main.async {
//                                            //modelworkers = workerList
//                                        }
                 //   }
                
                
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
        return "OK"
    }
    
       
}

//struct LogIn: View {
//    @StateObject var userData = UserData()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                LoginView(userData: userData)
//                //NavigationLink("Go to Profile", destination: ProfileView(userData: userData))
//            }
//            .navigationBarTitle("Login Example")
//        }
//    }
//}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
       // let userData = UserData()
       // LogIn(userDataLogin: UserData(loginID: ""))
        //CommonPower(isPresented: $isShowingPop)
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
