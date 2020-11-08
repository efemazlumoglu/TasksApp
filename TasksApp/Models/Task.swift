//
//  Task.swift
//  TasksApp
//
//  Created by Efe Mazlumoğlu on 8.11.2020.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum TaskPriority: Int, Codable {
    case high
    case medium
    case low
}

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var priority: TaskPriority
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}

#if DEBUG
let testDataTask = [
    Task(title: "Implement UI", priority: .medium, completed: true),
    Task(title: "Connect to Firebase", priority: .medium, completed: false),
    Task(title: "App delegate errors fix", priority: .high, completed: false),
    Task(title: "PROFIT!!!", priority: .high, completed: false)
]
#endif
