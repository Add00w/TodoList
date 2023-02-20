//
//  Task.swift
//  TodoList
//
//  Created by Abdullah Addow on 1/18/23.
//  Copyright © 2023 Abdullah Addow. All rights reserved.
//

import Foundation
import SwiftUI

struct TaskItem: View {
    @EnvironmentObject var tasksStore: TasksStore
    var task: Task
    
    
    
    var body: some View {
        return HStack {
            Button(action: { self.tasksStore.toggleStatus(task)}) {
                Text(self.task.title)
            }.buttonStyle(.borderless)
            Spacer()
            if task.isDone {
                Image(systemName: "checkmark").foregroundColor(.green)
            }
        }
    }
    
}
