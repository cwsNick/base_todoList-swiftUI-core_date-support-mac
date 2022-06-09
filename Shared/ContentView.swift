//
//  ContentView.swift
//  Shared
//
//  Created by Wan Si Chong on 31/5/2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

struct todoView: View {
    #if os(iOS)
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .white
        UITableView.appearance().backgroundColor = .white
    }
    #endif
    
    var body: some View {
        #if os(iOS)
        VStack {
            TaskList()
            Spacer()
            EditorView()
        }
        #else
        HStack {
            TaskList()
            EditorView()
        }
        #endif
    }
}

struct LoginView : View {
    
    @State var unLocked = false
    
    var body: some View {
        ZStack {
            
            if unLocked {
                todoView()
            } else {
                LockScreenView(unLocked: $unLocked)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let persistentContainer = CoreDataController.shared.persistent
        
        ContentView()
            .environment(\.managedObjectContext, persistentContainer.viewContext)
    }
}
