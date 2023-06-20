//
//  NewTravelViewItemModel.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-14.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

///View model for single travel item (each row in travel items)
class ToTravelListViewItemModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TravelListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("travel")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
