//
//  CoreDataController.swift
//  base_todoList-swiftUI-core_date
//
//  Created by Wan Si Chong on 31/5/2022.
//

import Foundation
import CoreData

class CoreDataController {
    let persistent: NSPersistentContainer
    static let shared: CoreDataController = CoreDataController()
    
    private init() {
        persistent = NSPersistentContainer(name: "Model")
        persistent.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to init Core Data \(error)")
            }
        }
    }
}

enum TaskType: String, Identifiable, CaseIterable {
    var id: UUID {
        return UUID()
    }
    
    case urgent_importan = "Urgent and Important"
    case important_not_urgent = "Important but not Urgent"
    case unimportant_but_urgent = "Unimportant but Urgent"
    case unimportant_not_urgent = "Unimportant and Not Urgent"
}

extension TaskType {
    var title: String {
        switch self {
        case .urgent_importan:
            return "Urgent and Important"
        case .important_not_urgent:
            return "Important but not Urgent"
        case .unimportant_but_urgent:
            return "Unimportant but Urgent"
        case .unimportant_not_urgent:
            return "Unimportant and Not Urgent"
        }
    }
}
