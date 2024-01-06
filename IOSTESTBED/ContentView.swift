//
//  ContentView.swift
//  IOSTESTBED
//
//  Created by KX60 on 2023/12/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var selection: Tab = .assembly
    
    enum Tab {
        case assembly
        case work
        case common
    }

    var body: some View {
        VStack {
            Text("Top text centred in top box")
                            .frame(minWidth: 0,
                                   maxWidth: .infinity,
                                   minHeight: 0,
                                   maxHeight: 40)
                            .background(Color.green)
            
            Text("Image View Sample")
                .font(.body)
                .frame(width: .infinity, height: 40)
            Image("main")
                .resizable()
               // .aspectRatio(contentMode: .fit)
                .frame(width: .infinity, height: 150)
            
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
            TabView(selection: $selection)
            {
                AssemblyHome().tabItem { Text("조립") }.tag(Tab.assembly)
                WorkHome().tabItem { Text("업무") }.tag(Tab.work)
                CommonHome().tabItem { Text("공통") }.tag(Tab.common)
            }.accentColor(.green)
        }
        
        
        
        
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
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .full
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
