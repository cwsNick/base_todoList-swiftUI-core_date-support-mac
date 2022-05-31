//
//  EditorView.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 31/5/2022.
//

import SwiftUI

struct EditorView: View {
    
    @State private var title: String = ""
    @State private var selectedPriority: TaskType = .unimportant_but_urgent
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)]) private var allTask: FetchedResults<Task>
    
    private func saveTask() {
        do {
            let task = Task(context: viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.dateCreated = Date()
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                Text("Title")
                    .font(.callout)
                    .fontWeight(.bold)
                #if os(iOS)
                TextBox(hint: "Enter Title", string: $title)
                #else
                TextField("Enter Title", text: $title)
                #endif
                #if os(iOS)
                Text("Type")
                    .font(.callout)
                    .fontWeight(.bold)
                #endif
                
                
                Picker("TaskType", selection: $selectedPriority) {
                    
                    ForEach(TaskType.allCases) { priority in
                        
                        Text(priority.title)
                            .tag(priority)
                    }
                }
                #if os(iOS)
                .pickerStyle(WheelPickerStyle())
                .frame(height: 100)
                #endif
            }
                        
            Button(action: {
                saveTask()
            }) {
                TextButton(sysImage: "plus.circle.fill", title: "Add")
            }
            .buttonStyle(PlainButtonStyle())
            
            #if os(OSX)
            Spacer()
            #endif
        }
        .padding()
        .background(Color(red: 239/255, green: 243/255, blue: 244/255))
    }
}


struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorView()
    }
}
