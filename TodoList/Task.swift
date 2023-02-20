//
//  Task.swift
//  TodoList
//
//  Created by Abdullah Addow on 1/18/23.
//  Copyright © 2023 Abdullah Addow. All rights reserved.
//

import Foundation

struct Task: Equatable, Hashable, Codable, Identifiable {
  let id: UUID
  var title: String
  var isDone: Bool

    init(title: String,isDone: Bool = false) {
    self.id = UUID()
    self.title = title
    self.isDone=isDone
  }
}
