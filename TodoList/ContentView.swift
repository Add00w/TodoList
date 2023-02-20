//
//  ContentView.swift
//  TodoList
//
//  Created by Abdullah Addow on 1/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TasksView().environmentObject(TasksStore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
