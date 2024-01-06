//
//  WorkHome.swift
//  IOSTESTBED
//
//  Created by KX60 on 2024/01/04.
//

import SwiftUI

struct WorkHome: View {
    
   // var optionalCustomUIColor: UIColor? = UIColor(red: 100/255, green: 150/255, blue: 200/255, alpha: 1.0) // Optional custom UIColor
    
   //     let colorbutton : UIColor? = UIColor(named:"ColorButton")
    
    @State private var isButtonHidden = true
    
   // @State private var showingProfile = false
    
    @State private var isShowingPopup = false
    
    let colorbutton = Color(red: 230/255, green: 230/255, blue: 230/255)
    let colorround = Color(red: 200/255, green: 200/255, blue: 200/255)
            
    var body: some View {
           VStack {
                   HStack {
                    if isButtonHidden {
                        Button(action: {
                           // self.present(WorkPOR(), animated: true)
                               }) {
                                   VStack {
                                       Image("iconcar")
                                       Text("Like")
                                   }
                                   .padding()
                                   .foregroundColor(.white)
                                   .background(Color.gray)
                                   .cornerRadius(8)
                                  // .frame(width:300)
                                   
                        }
                    }
                    else {
                        Button(action: {}) {}
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.white)
                    }
                    
                    Button(action: {
                               // Action to perform when the first button is tapped
                              //  showingProfile.toggle()
                           }) {
                               VStack {
                                   Image("iconcar")
                                   Text("Like")
                               }
                               .padding()
                               .foregroundColor(Color.red)
                               .background(Color.gray)
                               .cornerRadius(8)
                               
                           }
                           // .sheet(isPresented: $showingProfile) {
                           //     WorkPOR()
                           // }
                       
                   }
                    HStack {
                        Button(action: {
                                   // Action to perform when the first button is tapped
                            //self.background(Color.Red)
                                print("First Button tapped!")
                                    
                               }) {
                                   VStack {
                                       Image("iconcar")
                                       Text("Like123")
                                   }
                                   .padding()
                                   .foregroundColor(.black)
                                   .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(colorround, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                                    )
                                    
                        }
                    }
                    HStack {
                        
                        
                        Button(action: {
                            //isShowingPopup = true
                            //WorkPOR(isPresented: $isShowingPopup)
                                   // Action to perform when the first button is tapped
                            //self.background(Color.Red)
                             //   print("First Button tapped!")
                               
                           // .fullScreenCover(
                               
                            //)
                            
                               }) {
                                   VStack {
                                       Image("iconcar")
                                       Text("Like")
                                   }
                                   .padding()
                                   .foregroundColor(.white)
                                   .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.blue, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(UIColor.blue)))
                                    )
                               }
                        
                        Button(action: {
                               // Action to perform when the first button is tapped
                               //print("First Button tapped!")
                            isShowingPopup = true
                           }) {
                               VStack {
                                   Image("iconcar") // SF Symbol as button image
                                   Text("Like")
                               }
                               .padding()
                               .foregroundColor(.white)
                               .background(Color.blue)
                               .cornerRadius(8)
                           }
                        //.sheet(isPresented: $isShowingPopup) {
                        //    WorkPOR(isPresented: $isShowingPopup)
                        //}
                        .fullScreenCover(isPresented: $isShowingPopup) {
                            // Popup view displayed as a sheet
                            //WorkPOR(isPresented: $isShowingPopup)
                            WorkPOR(isPresented: $isShowingPopup)
                        }
                    
                }
             }
           .padding()
       }}

struct WorkHome_Previews: PreviewProvider {
    static var previews: some View {
        WorkHome()
        //Group {
           
        //}
    }
}
