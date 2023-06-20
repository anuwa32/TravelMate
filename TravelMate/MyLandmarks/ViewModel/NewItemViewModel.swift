//
//  NewItemViewModel.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-14.
//

import Firebase
import FirebaseFirestore
import Foundation

class NeWItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        //Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create model
        let newId = UUID().uuidString
        let newItem = TravelListItem(id: newId,
                                     title: title,
                                     dueDate: dueDate.timeIntervalSince1970,
                                     createDate: Date().timeIntervalSince1970,
                                     isDone: false)
        
        //Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("travel")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // 86400 seconds for date
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
