//
//  IOSTESTBEDApp.swift
//  IOSTESTBED
//
//  Created by KX60 on 2023/12/23.
//

import SwiftUI

@main
struct IOSTESTBEDApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView() .environment(\.managedObjectContext, persistenceController.container.viewContext)
           // LogIn()
        }
    }
}
