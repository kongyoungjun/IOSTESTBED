
import SwiftUI

struct AssemblyHome: View {
    
   // var optionalCustomUIColor: UIColor? = UIColor(red: 100/255, green: 150/255, blue: 200/255, alpha: 1.0) // Optional custom UIColor
    
   //     let colorbutton : UIColor? = UIColor(named:"ColorButton")
    
    
    
    
    @State private var isButton1Hidden = true
    @State private var isButton2Hidden = true
    @State private var isButton3Hidden = true
    @State private var isButton4Hidden = true
    @State private var isButton5Hidden = true
    @State private var isButton6Hidden = true
    @State private var isButton7Hidden = false
    @State private var isButton8Hidden = false
    @State private var isButton9Hidden = false
    
   // @State private var showingProfile = false
    
    @State private var isShowingPopup = false
    @State private var isShowingPopup1: Bool = false
    @State private var isShowingPopup2: Bool = false
    @State private var isShowingPopup3: Bool = false
    @State private var isShowingPopup4: Bool = false
    @State private var isShowingPopup5: Bool = false
    @State private var isShowingPopup6: Bool = false
    @State private var isShowingPopup7: Bool = false
    @State private var isShowingPopup8: Bool = false
    @State private var isShowingPopup9: Bool = false
    
    let colorbutton = Color(red: 230/255, green: 230/255, blue: 230/255)
    let colorround = Color(red: 200/255, green: 200/255, blue: 200/255)
            
    var body: some View {
        VStack {
                   HStack {
                        if isButton1Hidden {
                            Button(action: {
                                isShowingPopup1 = true
                                   }) {
                                       VStack {
                                           Image("iconship").resizable().frame(width: 50, height: 50)
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
                            }.fullScreenCover(isPresented: $isShowingPopup1) {
                                AssemblySearchShip(isPresented: $isShowingPopup1)
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
                            isShowingPopup2 = true
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
                                    ).fullScreenCover(isPresented: $isShowingPopup2) {
                                        AssemblySearchResult1(isPresented: $isShowingPopup2)
                                     }
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
                                    Image("iconsearch").resizable().frame(width: 50, height: 50)
                                 Text("호선담당자").font(.system(size:12))
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
                                Image("iconmonitoring").resizable().frame(width: 50, height: 50)
                             Text("대형모니터링").font(.system(size:12))
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
                                Image("iconmonitoring").resizable().frame(width: 50, height: 50)
                             Text("힘센모니터링").font(.system(size:12))
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
                 if isButton7Hidden {
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
             if isButton8Hidden {
                Button(action: {isShowingPopup1 = true}){
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
                 }.fullScreenCover(isPresented: $isShowingPopup1) {
                    WorkerList(isPresented: $isShowingPopup1)
                 }
             }
             else {
                 Button(action: {}) {}
                     .frame(width: 70, height: 60)
                     .padding()
                     .foregroundColor(.white)
                     .background(Color.white)
             }
             
             if isButton9Hidden {
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

//struct AssemblyHome: View {
//
//    @State private var isButton1Hidden = true
//    @State private var isButton2Hidden = true
//    @State private var isButton3Hidden = true
//    @State private var isButton4Hidden = true
//    @State private var isButton5Hidden = true
//    @State private var isButton6Hidden = true
//    @State private var isButton7Hidden = true
//    @State private var isButton8Hidden = true
//    @State private var isButton9Hidden = true
//
//   // @State private var showingProfile = false
//
//    @State private var isShowingPopup = false
//    @State private var isShowingPopup1: Bool = false
//
//    let colorbutton = Color(red: 230/255, green: 230/255, blue: 230/255)
//    let colorround = Color(red: 200/255, green: 200/255, blue: 200/255)
//
//    var body: some View {
//        VStack {
//                   HStack {
//                        if isButton1Hidden {
//                            Button(action: {
//                               // self.present(WorkPOR(), animated: true)
//                                   }) {
//                                       VStack {
//                                           Image("iconship")
//                                        Text("호선정보조회").font(.system(size:12))
//                                       }
//                                       //.frame(minWidth:70, maxWidth: .infinity * 1/3 - 10, minHeight: 60, maxHeight: 70)
//                                       .frame(width: 70, height: 60)
//                                       .padding()
//                                       .foregroundColor(.black)
//                                       .background(
//                                            RoundedRectangle(cornerRadius: 8)
//                                                .stroke(colorround, lineWidth: 2)
//                                                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                                        )
//                            }
//                        }
//                        else {
//                            Button(action: {}) {}
//                                .frame(width: 70, height: 60)
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(Color.white)
//                        }
//                    if isButton2Hidden {
//                        Button(action: {
//                           // self.present(WorkPOR(), animated: true)
//                               }) {
//                                   VStack {
//                                       Image("iconbigengine")
//                                       Text("대형실적관리").font(.system(size:12))
//                                   }
//                                   .frame(width: 70, height: 60)
//                                   .padding()
//                                   .foregroundColor(.black)
//                                   .background(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(colorround, lineWidth: 2)
//                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                                    )
//                        }
//                    }
//                    else {
//                        Button(action: {}) {}
//                            .frame(width: 70, height: 60)
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(Color.white)
//                    }
//
//                    if isButton3Hidden {
//                        Button(action: {
//                           // self.present(WorkPOR(), animated: true)
//                               }) {
//                                   VStack {
//                                       Image("iconhimengine")
//                                       Text("힘센실적관리").font(.system(size:12))
//                                   }
//                                   .frame(width: 70, height: 60)
//                                   .padding()
//                                   .foregroundColor(.black)
//                                   .background(
//                                        RoundedRectangle(cornerRadius: 8)
//                                            .stroke(colorround, lineWidth: 2)
//                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                                    )
//                        }
//                    }
//                    else {
//                        Button(action: {}) {}
//                            .frame(width: 70, height: 60)
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(Color.white)
//                    }
//
//                   }
//            HStack {
//                 if isButton4Hidden {
//                     Button(action: {
//                        // self.present(WorkPOR(), animated: true)
//                            }) {
//                                VStack {
//                                    Image("iconship")
//                                 Text("호선정보조회").font(.system(size:12))
//                                }
//                                .frame(width: 70, height: 60)
//                                .padding()
//                                .foregroundColor(.black)
//                                .background(
//                                     RoundedRectangle(cornerRadius: 8)
//                                         .stroke(colorround, lineWidth: 2)
//                                         .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                                 )
//                     }
//                 }
//                 else {
//                     Button(action: {}) {}
//                         .frame(width: 70, height: 60)
//                         .padding()
//                         .foregroundColor(.white)
//                         .background(Color.white)
//                 }
//             if isButton5Hidden {
//                 Button(action: {
//                    // self.present(WorkPOR(), animated: true)
//                        }) {
//                            VStack {
//                                Image("iconbigengine")
//                                Text("호선정보조회").font(.system(size:12))
//                            }
//                            .frame(width: 70, height: 60)
//                            .padding()
//                            .foregroundColor(.black)
//                            .background(
//                                 RoundedRectangle(cornerRadius: 8)
//                                     .stroke(colorround, lineWidth: 2)
//                                     .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                             )
//                 }
//             }
//             else {
//                 Button(action: {}) {}
//                     .frame(width: 70, height: 60)
//                     .padding()
//                     .foregroundColor(.white)
//                     .background(Color.white)
//             }
//
//             if isButton6Hidden {
//                 Button(action: {
//                    // self.present(WorkPOR(), animated: true)
//                        }) {
//                            VStack {
//                                Image("iconship")
//                                Text("호선정보조회").font(.system(size:12))
//                            }
//                            .frame(width: 70, height: 60)
//                            .padding()
//                            .foregroundColor(.black)
//                            .background(
//                                 RoundedRectangle(cornerRadius: 8)
//                                     .stroke(colorround, lineWidth: 2)
//                                     .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                             )
//                 }
//             }
//             else {
//                 Button(action: {}) {}
//                     .frame(width: 70, height: 60)
//                     .padding()
//                     .foregroundColor(.white)
//                     .background(Color.white)
//             }
//
//            }
//            HStack {
//                 if isButton7Hidden {
//                     Button(action: {
//                        // self.present(WorkPOR(), animated: true)
//                            }) {
//                                VStack {
//                                    Image("iconship")
//                                 Text("호선정보조회").font(.system(size:12))
//                                }
//                                .frame(width: 70, height: 60)
//                                .padding()
//                                .foregroundColor(.black)
//                                .background(
//                                     RoundedRectangle(cornerRadius: 8)
//                                         .stroke(colorround, lineWidth: 2)
//                                         .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                                 )
//                     }
//                 }
//                 else {
//                     Button(action: {}) {}
//                         .frame(width: 70, height: 60)
//                         .padding()
//                         .foregroundColor(.white)
//                         .background(Color.white)
//                 }
//             if isButton8Hidden {
//                Button(action: {isShowingPopup1 = true}){
//                            VStack {
//                                Image("iconbigengine")
//                                Text("호선정보조회").font(.system(size:12))
//                            }
//                            .frame(width: 70, height: 60)
//                            .padding()
//                            .foregroundColor(.black)
//                            .background(
//                                 RoundedRectangle(cornerRadius: 8)
//                                     .stroke(colorround, lineWidth: 2)
//                                     .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                             )
//                 }.fullScreenCover(isPresented: $isShowingPopup1) {
//                    WorkerList(isPresented: $isShowingPopup1)
//                 }
//             }
//             else {
//                 Button(action: {}) {}
//                     .frame(width: 70, height: 60)
//                     .padding()
//                     .foregroundColor(.white)
//                     .background(Color.white)
//             }
//
//             if isButton9Hidden {
//                 Button(action: {isShowingPopup = true})
//                 {
//                            VStack {
//                                Image("iconship")
//                                Text("호선정보조회").font(.system(size:12))
//                            }
//                            .frame(width: 70, height: 60)
//                            .padding()
//                            .foregroundColor(.black)
//                            .background(
//                                 RoundedRectangle(cornerRadius: 8)
//                                     .stroke(colorround, lineWidth: 2)
//                                     .background(RoundedRectangle(cornerRadius: 8).foregroundColor(colorbutton))
//                             )
//
//                 }.fullScreenCover(isPresented: $isShowingPopup) {
//                    WorkPOR(isPresented: $isShowingPopup)
//                 }
//             }
//             else {
//                 Button(action: {}) {}
//                     .frame(width: 70, height: 60)
//                     .padding()
//                     .foregroundColor(.white)
//                     .background(Color.white)
//             }
//
//            }
//
////                    HStack {
////                        Button(action: {
////
////                               }) {
////                                   VStack {
////                                       Image("iconcar")
////                                       Text("Like")
////                                   }
////                                   .padding()
////                                   .foregroundColor(.white)
////                                   .background(
////                                        RoundedRectangle(cornerRadius: 8)
////                                            .stroke(Color.blue, lineWidth: 2)
////                                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(UIColor.blue)))
////                                    )
////                               }
////
////                        Button(action: {
////                               // Action to perform when the first button is tapped
////                               //print("First Button tapped!")
////                            isShowingPopup = true
////                           }) {
////                               VStack {
////                                   Image("iconcar") // SF Symbol as button image
////                                   Text("Like")
////                               }
////                               .padding()
////                               .foregroundColor(.white)
////                               .background(Color.blue)
////                               .cornerRadius(8)
////                           }
////                        //.sheet(isPresented: $isShowingPopup) {
////                        //    WorkPOR(isPresented: $isShowingPopup)
////                        //}
////                        .fullScreenCover(isPresented: $isShowingPopup) {
////                            // Popup view displayed as a sheet
////                            //WorkPOR(isPresented: $isShowingPopup)
////                            WorkPOR(isPresented: $isShowingPopup)
////                        }
////
////                }
//        }//.padding(.all, 10)
//    }
//
//}

//struct AssemblyHome: View {
//   // @State private var isActiveShip: Bool = false
//    @State private var showNewScreen: Bool = false
//
//    var body: some View {
//        VStack {
//                    Button(action: {
//                        showNewScreen.toggle()
//                    }) {
//                        Text("Present Full Screen")
//                            .padding()
//                            .foregroundColor(.white)
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    .fullScreenCover(isPresented: $showNewScreen, content: {
//                        AssemblySearchShip()
//                    })
//                }
//    }
//}

struct AssemblyHome_Previews: PreviewProvider {
    static var previews: some View {
        AssemblyHome()
    }
}
