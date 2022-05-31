//
//  base_todoList_swiftUI_core_dateApp.swift
//  Shared
//
//  Created by Wan Si Chong on 31/5/2022.
//

import SwiftUI

@main
struct base_todoList_swiftUI_core_dateApp: App {
    
    let persistentContainer = CoreDataController.shared.persistent
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
