//
//  toDoWonderApp.swift
//  toDoWonder
//
//  Created by Mac on 29.06.2022.
//

import SwiftUI

@main
struct toDoWonderApp: App {
    
  @StateObject  var listViewMode: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            TabView {
                NavigationView {
                    ListView()
                    }.tabItem {
                        Label("Liste", image: "list")
                        
                }
                AddNewToDo()
                    .tabItem {
                        Label("Oluştur", image: "add")
                    }
            }.environmentObject(listViewMode)
        }
    }
}
