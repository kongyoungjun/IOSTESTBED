//
//  WorkDailywork.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/08.
//

import SwiftUI

struct WorkDailywork: View {
    
    @State var name = ""
        init() {
                //Use this if NavigationBarTitle is with Large Font
               UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
               UINavigationBar.appearance().backgroundColor = .gray
            }
    
    var body: some View {
        NavigationView {
                   
                   ZStack{
                       VStack{
                           TextField("Name", text: $name)
                               .frame(height:200)
                               .padding()
                            .background(Color.gray)
                               .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 4))
                               .padding()
                           Spacer()
                       }.navigationTitle("Tanvir")
                       .background(Color.green.edgesIgnoringSafeArea(.all))
                   }
                   
               }
    }
}

struct WorkDailywork_Previews: PreviewProvider {
    static var previews: some View {
        WorkDailywork()
    }
}
