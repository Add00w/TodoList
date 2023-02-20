//
//  ContentView.swift
//  TodoList
//
//  Created by Abdullah Addow on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TasksView().environmentObject(TodosStore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
