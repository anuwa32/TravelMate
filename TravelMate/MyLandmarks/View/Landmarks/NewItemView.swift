//
//  NewItemView.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-14.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NeWItemViewModel()
    @Binding var newItemPresented: Bool
    //@State private var saveButtonTapped = false
    
    var body: some View {
        VStack {
            Text("New Plans")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //Button
                ButtonView(title: "Save", background: .blue) {
                    //saveButtonTapped = true
                    
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(""), message: Text("Please fill the all details and make sure select due date is today or newer date.."))
            }
        }
//        .onChange(of: saveButtonTapped) { tapped in
//            if tapped {
//                viewModel.save()
//                newItemPresented = false // Assign the updated value to the binding
//            }
//        }

    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
