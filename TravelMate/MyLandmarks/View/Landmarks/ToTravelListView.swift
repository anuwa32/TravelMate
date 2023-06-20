//
//  ToTravelListView.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-14.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToTravelListView: View {
    @StateObject var viewModel: ToTravelListViewModel
    @FirestoreQuery  var items: [TravelListItem]
    
    //private let userId: String
    
    init(userId: String) {
        //self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/travel")
        
        self._viewModel = StateObject(wrappedValue: ToTravelListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToTravelListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Upcomming Travel List")
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToTravelListView_Previews: PreviewProvider {
    static var previews: some View {
        ToTravelListView(userId: "3IP6FHdjX2ard4cc1yVdv2X40lX2")
    }
}
