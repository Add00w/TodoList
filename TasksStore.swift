//
//  Task.swift
//  TodoList
//
//  Created by Abdullah Addow on 1/18/23.
//  Copyright © 2023 Abdullah Addow. All rights reserved.
//

import Combine
import Foundation


final class TasksStore: ObservableObject {
 @Published var tasks: [Task] {
    didSet {
        UserDefaults.standard.set(try? JSONEncoder().encode(tasks), forKey: "Tasks")
    }
  }
    init() {
        tasks = UserDefaults.standard.data(forKey: "Tasks").flatMap {
              try? JSONDecoder().decode([Task].self, from: $0)
            } ?? defaultTasks
    }
    func create(_ title: String) {
        let item = Task(title: title)
        tasks.append(item)
      }
      
      func toggleStatus(_ item: Task) {
        index(of: item).map { tasks[$0].isDone.toggle() }
      }
    private func index(of item: Task) -> Int? {
        return tasks.firstIndex(of: item)
      }
    func remove(at index: Int) {
        tasks.remove(at: index)
      }
}

private let defaultTasks: [Task] = [
  Task(title: "Read SwiftUI Documentation 📚"),
  Task(title: "Watch WWDC19 Keynote 🎉"),
]
