//
//  ContentView.swift
//  MyLandmarks
//
//  Created by anupriya 06/13/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    //@FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var landmarks: FetchedResults<Landmark>
    
    //@State private var showingAddView = false
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        //LandmarkList()
        //LoginView()
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            LandmarkList()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ToTravelListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Travel List", systemImage: "list.bullet")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataController())
    }
}
