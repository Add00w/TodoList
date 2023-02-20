//
//  TodoList
//
//  Created by Abdullah Addow on 2/18/23.
//  Copyright © 2023 Abdullah Addow. All rights reserved.
//

import Foundation
import SwiftUI

struct TodoItem: View {
    @EnvironmentObject var todosStore: TodosStore
    var todo: Todo
    
    
    
    var body: some View {
        return HStack {
            Button(action: { self.todosStore.toggleStatus(todo)}) {
                Text(self.todo.title)
            }.buttonStyle(.borderless)
            Spacer()
            if todo.isDone {
                Image(systemName: "checkmark").foregroundColor(.green)
            }
        }
    }
    
}
