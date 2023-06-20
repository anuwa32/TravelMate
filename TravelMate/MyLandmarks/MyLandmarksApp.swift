//
//  MyLandmarksApp.swift
//  MyLandmarks
//
//  Created by anupriya 06/13/2023
//

import FirebaseCore
import SwiftUI

@main
struct MyLandmarksApp: App {
    @StateObject var dataController = DataController()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataController)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
