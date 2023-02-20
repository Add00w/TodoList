//
//  TasksView.swift
//  TodoList
//
//  Created by Abdullah Addow on 1/18/23.
//

import Foundation

import SwiftUI

struct TasksView: View {
  @EnvironmentObject var tasksStore: TasksStore
  @State var draftTitle: String = ""

  var body: some View {
      NavigationView{
          List {
              HStack{
                  TextField("Create or search Task",text: $draftTitle)
                  Button(action: { self.createTask() }) {
                      Text("create")
                  }
              }.buttonStyle(.borderless)
              ForEach(self.tasksStore.tasks) { task in
                  TaskItem(task: task)
              } .onDelete { (indices) in
                  self.tasksStore.remove(at: indices.first!)
                }
          }
          .navigationTitle(Text("Tasks 👀"))
      }
  }
    private func createTask() {
        if (!self.draftTitle.isEmpty){
            self.tasksStore.create(self.draftTitle)
            self.draftTitle = ""
        }
     }
}

