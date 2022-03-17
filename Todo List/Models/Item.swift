//
//  Item.swift
//  Todo List
//
//  Created by Jason Cao on 3/16/22.
//

import Foundation

struct Item: Identifiable, Codable {
    
    var id: UUID?
    var title: String
    var isCompleted: Bool
    
}
