//
//  toDoListApp.swift
//  toDoList
//
//  Created by Борух Соколов on 09.08.2023.
//

import SwiftUI

@main
struct toDoListApp: App {
    
    @StateObject var listViewModel: ListViewModels = ListViewModels()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(listViewModel)
        }
    }
    
}
