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
    
    @State private var isButton1Hidden = true
    @State private var isButton2Hidden = true
    @State private var isButton3Hidden = true
    @State private var isButton4Hidden = true
    @State private var isButton5Hidden = true
    @State private var isButton6Hidden = true
    @State private var isButton7Hidden = true
    @State private var isButton8Hidden = true
    @State private var isButton9Hidden = true
    
   // @State private var showingProfile = false
    
    @State private var isShowingPopup = false
    
    let colorbutton = Color(red: 230/255, green: 230/255, blue: 230/255)
    let colorround = Color(red: 200/255, green: 200/255, blue: 200/255)
            
    var body: some View {
        VStack {
                   HStack {
                        if isButton1Hidden {
                            Button(action: {
                               // self.present(WorkPOR(), animated: true)
                                   }) {
                                       VStack {
                                           Image("iconship")
                                        Text("호선정보조회").font(.system(size:12))
                                       }
                                       .frame(width: 70, height: 60)
                                       .padding()
                                       .foregroundColor(.black)
                                       .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(colorround, lineWidth: 2)
                                                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                                        )
                            }
                        }
                        else {
                            Button(action: {}) {}
                                .frame(width: 70, height: 60)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.white)
                        }
                    if isButton2Hidden {
                        Button(action: {
                           // self.present(WorkPOR(), animated: true)
                               }) {
                                   VStack {
                                       Image("iconbigengine")
                                       Text("대형실적관리").font(.system(size:12))
                                   }
                                   .frame(width: 70, height: 60)
                                   .padding()
                                   .foregroundColor(.black)
                                   .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(colorround, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                                    )
                        }
                    }
                    else {
                        Button(action: {}) {}
                            .frame(width: 70, height: 60)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.white)
                    }
                    
                    if isButton3Hidden {
                        Button(action: {
                           // self.present(WorkPOR(), animated: true)
                               }) {
                                   VStack {
                                       Image("iconship")
                                       Text("힘센실적관리").font(.system(size:12))
                                   }
                                   .frame(width: 70, height: 60)
                                   .padding()
                                   .foregroundColor(.black)
                                   .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(colorround, lineWidth: 2)
                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                                    )
                        }
                    }
                    else {
                        Button(action: {}) {}
                            .frame(width: 70, height: 60)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.white)
                    }
                    
                   }
            HStack {
                 if isButton4Hidden {
                     Button(action: {
                        // self.present(WorkPOR(), animated: true)
                            }) {
                                VStack {
                                    Image("iconship")
                                 Text("호선정보조회").font(.system(size:12))
                                }
                                .frame(width: 70, height: 60)
                                .padding()
                                .foregroundColor(.black)
                                .background(
                                     RoundedRectangle(cornerRadius: 8)
                                         .stroke(colorround, lineWidth: 2)
                                         .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                                 )
                     }
                 }
                 else {
                     Button(action: {}) {}
                         .frame(width: 70, height: 60)
                         .padding()
                         .foregroundColor(.white)
                         .background(Color.white)
                 }
             if isButton5Hidden {
                 Button(action: {
                    // self.present(WorkPOR(), animated: true)
                        }) {
                            VStack {
                                Image("iconbigengine")
                                Text("호선정보조회").font(.system(size:12))
                            }
                            .frame(width: 70, height: 60)
                            .padding()
                            .foregroundColor(.black)
                            .background(
                                 RoundedRectangle(cornerRadius: 8)
                                     .stroke(colorround, lineWidth: 2)
                                     .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                             )
                 }
             }
             else {
                 Button(action: {}) {}
                     .frame(width: 70, height: 60)
                     .padding()
                     .foregroundColor(.white)
                     .background(Color.white)
             }
             
             if isButton6Hidden {
                 Button(action: {
                    // self.present(WorkPOR(), animated: true)
                        }) {
                            VStack {
                                Image("iconship")
                                Text("호선정보조회").font(.system(size:12))
                            }
                            .frame(width: 70, height: 60)
                            .padding()
                            .foregroundColor(.black)
                            .background(
                                 RoundedRectangle(cornerRadius: 8)
                                     .stroke(colorround, lineWidth: 2)
                                     .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                             )
                 }
             }
             else {
                 Button(action: {}) {}
                     .frame(width: 70, height: 60)
                     .padding()
                     .foregroundColor(.white)
                     .background(Color.white)
             }
             
            }
            HStack {
                 if isButton4Hidden {
                     Button(action: {
                        // self.present(WorkPOR(), animated: true)
                            }) {
                                VStack {
                                    Image("iconship")
                                 Text("호선정보조회").font(.system(size:12))
                                }
                                .frame(width: 70, height: 60)
                                .padding()
                                .foregroundColor(.black)
                                .background(
                                     RoundedRectangle(cornerRadius: 8)
                                         .stroke(colorround, lineWidth: 2)
                                         .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                                 )
                     }
                 }
                 else {
                     Button(action: {}) {}
                         .frame(width: 70, height: 60)
                         .padding()
                         .foregroundColor(.white)
                         .background(Color.white)
                 }
             if isButton5Hidden {
                 Button(action: {
                    // self.present(WorkPOR(), animated: true)
                        }) {
                            VStack {
                                Image("iconbigengine")
                                Text("호선정보조회").font(.system(size:12))
                            }
                            .frame(width: 70, height: 60)
                            .padding()
                            .foregroundColor(.black)
                            .background(
                                 RoundedRectangle(cornerRadius: 8)
                                     .stroke(colorround, lineWidth: 2)
                                     .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                             )
                 }
             }
             else {
                 Button(action: {}) {}
                     .frame(width: 70, height: 60)
                     .padding()
                     .foregroundColor(.white)
                     .background(Color.white)
             }
             
             if isButton6Hidden {
                 Button(action: {isShowingPopup = true})
                 {
                            VStack {
                                Image("iconship")
                                Text("호선정보조회").font(.system(size:12))
                            }
                            .frame(width: 70, height: 60)
                            .padding()
                            .foregroundColor(.black)
                            .background(
                                 RoundedRectangle(cornerRadius: 8)
                                     .stroke(colorround, lineWidth: 2)
                                     .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
                             )
                            
                 }.fullScreenCover(isPresented: $isShowingPopup) {
                    WorkPOR(isPresented: $isShowingPopup)
                 }
             }
             else {
                 Button(action: {}) {}
                     .frame(width: 70, height: 60)
                     .padding()
                     .foregroundColor(.white)
                     .background(Color.white)
             }
             
            }
            
//                    HStack {
//                        Button(action: {
//
//                               }) {
//                                   VStack {
//                                       Image("iconcar")
//                                       Text("Like")
//                                   }
//                                   .padding()
//                                   .foregroundColor(.white)
//                                   .background(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(Color.blue, lineWidth: 2)
//                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(UIColor.blue)))
//                                    )
//                               }
//
//                        Button(action: {
//                               // Action to perform when the first button is tapped
//                               //print("First Button tapped!")
//                            isShowingPopup = true
//                           }) {
//                               VStack {
//                                   Image("iconcar") // SF Symbol as button image
//                                   Text("Like")
//                               }
//                               .padding()
//                               .foregroundColor(.white)
//                               .background(Color.blue)
//                               .cornerRadius(8)
//                           }
//                        //.sheet(isPresented: $isShowingPopup) {
//                        //    WorkPOR(isPresented: $isShowingPopup)
//                        //}
//                        .fullScreenCover(isPresented: $isShowingPopup) {
//                            // Popup view displayed as a sheet
//                            //WorkPOR(isPresented: $isShowingPopup)
//                            WorkPOR(isPresented: $isShowingPopup)
//                        }
//
//                }
        }//.padding(.all, 10)
    }
    
}

struct WorkHome_Previews: PreviewProvider {
    static var previews: some View {
        WorkHome()
        //Group {
           
        //}
    }
}
