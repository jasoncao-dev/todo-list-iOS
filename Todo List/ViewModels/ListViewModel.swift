//
//  ListViewModel.swift
//  Todo List
//
//  Created by Jason Cao on 3/16/22.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items = [Item]() {
        didSet {
            saveItems()
        }
    }
    let itemKey: String = "items_list"
    
    init() {
        loadFirstData()
    }
    
    func loadFirstData() {
//        let newItems = [
//            Item(id: UUID(), title: "Finish Assignment #2", isCompleted: true),
//            Item(id: UUID(), title: "Do laundry", isCompleted: false),
//            Item(id: UUID(), title: "Take out the trash", isCompleted: true),
//            Item(id: UUID(), title: "Vaccum the floor", isCompleted: true),
//            Item(id: UUID(), title: "Do the dishes", isCompleted: false),
//        ]
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let decodedData = try? JSONDecoder().decode([Item].self, from: data)
        else { return }
        items.append(contentsOf: decodedData)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addNewItem(title: String) {
        items.insert(Item(id: UUID(), title: title, isCompleted: false), at: 0)
    }
    
    func updateItem(item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = Item(id: item.id, title: item.title, isCompleted: !item.isCompleted)
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
