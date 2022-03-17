//
//  AddView.swift
//  Todo List
//
//  Created by Jason Cao on 3/17/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    @State var alertMessage: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topTrailing) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding()
                })
                VStack(spacing: 20) {
                    Text("Add a new item")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 30.0)
                    TextField("Type something here...", text: $textFieldText)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .background(.bar)
                        .cornerRadius(10)
                    Button("Done", action: doneButtonPressed)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .padding(.horizontal, 45)
                        .background(.green)
                        .cornerRadius(30)
                }
                .padding()
            }
        }
        .alert(alertMessage, isPresented: $showAlert, actions: {
            Text(alertMessage)
        })
    }
    
    func doneButtonPressed() {
        if (textFieldText.count > 0) {
            listViewModel.addNewItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            alertMessage = "You must add title for todo item"
            showAlert.toggle()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(ListViewModel())
    }
}
