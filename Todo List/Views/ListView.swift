//
//  ListView.swift
//  Todo List
//
//  Created by Jason Cao on 3/16/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            List() {
                if (listViewModel.items.count == 0) {
                    Text("You don't have any tasks today 😴")
                } else {
                    ForEach(listViewModel.items) { item in
                        ListItemView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
            .navigationTitle(Text("Todo List 📝"))
            
            VStack {
                Spacer()
                HStack() {
                    EditButton()
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .padding(.horizontal, 45)
                        .background(.orange)
                        .cornerRadius(30)
                        .shadow(color: Color(hue: 1.0, saturation: 0.031, brightness: 0.897), radius: 10, x: 5, y: 5)
                    Spacer()
                    Button("Add", action: {
                        showSheet.toggle()
                    })
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .padding(.horizontal, 45)
                        .background(.green)
                        .cornerRadius(30)
                        .shadow(color: Color(hue: 1.0, saturation: 0.031, brightness: 0.897), radius: 10, x: 5, y: 5)
                        .sheet(isPresented: $showSheet, content: {
                            AddView()
                        })
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .padding(.horizontal)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
