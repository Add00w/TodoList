//
//  TodosView.swift
//  TodoList
//
//  Created by Abdullah Addow on 2/18/23.
//

import Foundation

import SwiftUI

struct TasksView: View {
  @EnvironmentObject var todosStore: TodosStore
  @State var todoTitle: String = ""

  var body: some View {
      NavigationView{
          List {
              HStack{
                  TextField("Create Todo",text: $todoTitle)
                  Button(action: { self.createTodo() }) {
                      Text("create")
                  }
              }.buttonStyle(.borderless)
              ForEach(self.todosStore.todos) { todo in
                  TodoItem(todo: todo)
              } .onDelete { (indices) in
                  self.todosStore.remove(at: indices.first!)
                }
          }
          .navigationTitle(Text("Todos 📝"))
      }
  }
    private func createTodo() {
        if (!self.todoTitle.isEmpty){
            self.todosStore.create(self.todoTitle)
            self.todoTitle = ""
        }
     }
}

