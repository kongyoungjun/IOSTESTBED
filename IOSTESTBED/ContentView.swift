//
//  ContentView.swift
//  IOSTESTBED
//
//  Created by KX60 on 2023/12/23.
//

import SwiftUI
import CoreData

extension Font {
    
    // Bold
    static let pretendardBold28: Font = .custom("Pretendard-Bold", size: 28)
    static let pretendardBold24: Font = .custom("Pretendard-Bold", size: 24)
    static let pretendardBold18: Font = .custom("Pretendard-Bold", size: 18)
    static let pretendardBold14: Font = .custom("Pretendard-Bold", size: 14)
    static let pretendardBold12: Font = .custom("Pretendard-Bold", size: 12)
    
    // SemiBold
//    static let pretendardSemiBold16: Font = .custom("Pretendard-SemiBold", size: 16)
//
//    // Medium
//    static let pretendardMedium18: Font = .custom("Pretendard-Medium", size: 18)
//    static let pretendardMedium16: Font = .custom("Pretendard-Medium", size: 16)
//
//    // Regular
//    static let pretendardRegular14: Font = .custom("Pretendard-Regular", size: 14)
//    static let pretendardRegular16: Font = .custom("Pretendard-Regular", size: 16)
    
}

struct ContentView: View {
    
    let colortop = Color(red: 0/255, green: 23/255, blue: 51/255)
    let colortab = Color(red: 9/255, green: 77/255, blue: 200/255)
    let colorround = Color(red: 200/255, green: 200/255, blue: 255/255)
    
    //let uiColortab = UIColor(colortab)
    init() {
            //Use this if NavigationBarTitle is with Large Font
           //UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
           //UINavigationBar.appearance().backgroundColor = .gray
            UITabBar.appearance().barTintColor = UIColor(colortab)
        }
    
    //private var items: FetchedResults<Item>
    @State private var selection: Tab = .assembly
    
    
    
    enum Tab {
        case assembly
        case work
        case common
    }
    
    var body: some View {
        //NavigationView {
            ZStack{
                VStack  {
                    VStack {
                        Text("사용자정보")
                            .multilineTextAlignment(.leading)
                            .font(Font.footnote.bold())
                                        .foregroundColor(.white)
                                        .frame(minWidth: 0,
                                               maxWidth: .infinity,
                                               minHeight: 0,
                                               maxHeight: 30)
                                        .background(colortop)
                        Image("main")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.size.width, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                           // .aspectRatio(contentMode: .fit)
                           // .frame(width: .infinity)
                    }
                    
              
                    TabView(selection: $selection)
                    {
                        AssemblyHome().tabItem {
                            Image("assembly")
                            Text("조립")
                        }
                        .tag(Tab.assembly)
                        WorkHome().tabItem {
                            Image("work")
                            Text("업무")
                            
                        }.tag(Tab.work)
                        CommHome().tabItem {
                            Image("common")
                            Text("공통")
                        }.tag(Tab.common)
                    }.accentColor(.green)
                    //.frame(height: 200) // Set the height of the TabView
                      //          .border(Color.gray) // Add a border for visual clarity
                                
                    //.background(Color.white)
                }
            }.background(colortop.edgesIgnoringSafeArea(.all))
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        ContentView()
        }
        
        
        // ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
    
    



            
            
            
            

//            Button(action: {
//                       // Action to perform when the first button is tapped
//                //self.background(Color.Red)
//                    print("First Button tapped!")
//
//                   }) {
//                       VStack {
//                           Image("iconcar")
//                           Text("Like123")
//                       }
//                       .padding()
//                       .foregroundColor(.black)
//                       .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//            }
//Spacer().frame(height: 30)

//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
            
            
            
//            TabView {
//                        // Add your tab views here
//                        Text("First Tab")
//                            .tabItem {
//                                //Image(systemName: "1.circle")
//                                Text("First").font(.headline)
//                            }
//                            .tag(0)
//
//                        Text("Second Tab")
//                            .tabItem {
//                                Text("Second").font(.headline)
//                            }
//                            .tag(1)
//
//                Text("\u{f075} Second View")
//                               .font(Font.custom("FontAwesome5Free-Solid", size:18))
//                               .tabItem {
//                                   Text("\u{f075} First View")
//                           }
//                           .tag(1)
//                    }.font(Font.custom("FontAwesome5Free-Solid", size:18))
//        }
//
        
    

        
        
        //ZStack
        //{
            
        //}.background(Color.blue)
        
        
                
        
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
//    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .full
//    return formatter
//}()

