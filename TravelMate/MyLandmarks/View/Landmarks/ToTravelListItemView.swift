//
//  TravelListItemView.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-14.
//

import SwiftUI

struct ToTravelListItemView: View {
    @StateObject var viewModel = ToTravelListViewItemModel()
    let item: TravelListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                    //.bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ToTravelListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToTravelListItemView(item: .init(id: "123",
                                         title: "Go Alagalla",
                                         dueDate: Date().timeIntervalSince1970,
                                         createDate: Date().timeIntervalSince1970,
                                         isDone: true))
    }
}
