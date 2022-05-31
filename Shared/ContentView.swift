//
//  ContentView.swift
//  Shared
//
//  Created by Wan Si Chong on 31/5/2022.
//

import SwiftUI


struct ContentView: View {
    
    #if os(iOS)
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .white
        UITableView.appearance().backgroundColor = .white
    }
    #endif
    
    var body: some View {
        #if os(iOS)
        NavigationView {
            
            VStack {
                TaskList()
                Spacer()
                EditorView()
            }
            .navigationTitle("To-Do List")
        }
        #else
        HStack {
            TaskList()
            EditorView()
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let persistentContainer = CoreDataController.shared.persistent

        ContentView()
            .environment(\.managedObjectContext, persistentContainer.viewContext)
    }
}
