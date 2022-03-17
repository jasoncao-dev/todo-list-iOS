//
//  ListItemView.swift
//  Todo List
//
//  Created by Jason Cao on 3/16/22.
//

import SwiftUI

struct ListItemView: View {
    var item: Item
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundColor(item.isCompleted ? .green : .gray)
            Text(item.title)
                .foregroundColor(item.isCompleted ? .gray : .black)
            Spacer()
        }
        .padding(.vertical, 3.0)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var testData = Item(id: UUID(), title: "Test", isCompleted: true)
    
    static var previews: some View {
        ListItemView(item: testData)
            .previewLayout(.sizeThatFits)
    }
}
