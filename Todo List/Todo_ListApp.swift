//
//  Todo_ListApp.swift
//  Todo List
//
//  Created by Jason Cao on 3/16/22.
//

import SwiftUI

@main
struct Todo_ListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
