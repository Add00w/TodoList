//
//  TodoList
//
//  Created by Abdullah Addow on 2/18/23.
//  Copyright © 2023 Abdullah Addow. All rights reserved.
//

import Foundation


final class TodosStore: ObservableObject {
 @Published var todos: [Todo] {
    didSet {
        UserDefaults.standard.set(try? JSONEncoder().encode(todos), forKey: "Todos")
    }
  }
    init() {
        todos = UserDefaults.standard.data(forKey: "Todos").flatMap {
              try? JSONDecoder().decode([Todo].self, from: $0)
            } ?? defaultTodos
    }
    func create(_ title: String) {
        let item = Todo(title: title)
        todos.append(item)
      }
      
      func toggleStatus(_ item: Todo) {
        index(of: item).map { todos[$0].isDone.toggle() }
      }
    private func index(of item: Todo) -> Int? {
        return todos.firstIndex(of: item)
      }
    func remove(at index: Int) {
        todos.remove(at: index)
      }
}

private let defaultTodos: [Todo] = [
  Todo(title: "Read SwiftUI Documentation 📚"),
  Todo(title: "Watch WWDC19 Keynote 🎉"),
]
