//
//  TaskList.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 31/5/2022.
//

import SwiftUI


struct TaskList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)]) private var allTask: FetchedResults<Task>
    
    var body: some View {
        List {
            ForEach(allTask) { task in
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: 20)
                        Text(task.title ?? "")
                            .fontWeight(.bold)
                            .font(.callout)
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                            .onTapGesture {
                                deleteTaskBtn(task)
                            }
                        Image(systemName: task.isFavorite ? "bookmark.fill" : "bookmark")
                            .foregroundColor(.white)
                            .onTapGesture {
                                setFavorite(task)
                            }
                    }
                    .padding()
                }
                .foregroundColor(.white)
                .background(styleForPriority(task.priority!))
                .cornerRadius(9)
                .shadow(radius: 3)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .onDelete(perform: deleteTask)
        }
    }
    
    private func styleForPriority(_ value: String) -> Color {
        let priority = TaskType(rawValue: value)
        
        switch priority {
        case .unimportant_but_urgent:
            return Color.green
        case .important_not_urgent:
            return Color.yellow
        case .urgent_importan:
            return Color.red
        case .unimportant_not_urgent:
            return Color.gray
        default:
            return Color.black
        }
    }
    
    private func setFavorite(_ task: Task) {
        task.isFavorite = !task.isFavorite
        saveViewContext()
    }
    
    private func deleteTaskBtn(_ task: Task) {
        viewContext.delete(task)
        saveViewContext()
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = allTask[index]
            viewContext.delete(task)
            saveViewContext()
        }
    }
    
    private func saveViewContext() {
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}


struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
