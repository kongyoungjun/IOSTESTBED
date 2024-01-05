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
        @State private var isLoggedIn = false
    var body: some View {
        VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .padding()

                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: {
                        //ContentView()
                        // Simulate login process
                        //if username == "user" && password == "password" {
                        //    isLoggedIn = true
                        //}
                    }) {
                        Text("Login")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }

                    if isLoggedIn {
                        Text("Logged in as \(username)")
                            .padding()
                    }
                }
                .padding()
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}
