//
//  LandmarkDetails.swift
//  MyLandmarks
//
//  Created by anupriya 06/13/2023.
//

import SwiftUI
import MapKit

struct LandmarkDetails: View {
    @EnvironmentObject var dataController: DataController
    var landmark: Landmark
    
    var landmarkIndex: Int {
        dataController.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: CLLocationCoordinate2DMake(46.0569, 14.5058)) // Displaying a map view with a specific coordinate
                .frame(height: 300)
            
            if landmark.imageData != nil {
                HStack {
                    Spacer()
                    CircleImage(imageData: landmark.imageData) // Displaying an image associated with the landmark
                        .offset(y: -130)
                        .padding(.bottom, -130)
                    Spacer()
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                   Text(landmark.name ?? "No name")
                        .font(.title)
                    FavoriteButton(
                        isSet: $dataController.landmarks[landmarkIndex].isFavorite,
                        landmark: dataController.landmarks[landmarkIndex])
                }
                
                HStack {
                    Text(landmark.category ?? "No category")
                        .font(.subheadline)
                    Spacer()
                    Text(formatDate(date: landmark.date!))
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()

                Text("About \(landmark.name ?? "No name")")
                    .font(.title2)
                
                Text(landmark.desc ?? "No description.")
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name ?? "No name...")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetails_Previews: PreviewProvider {
    static let dataController = DataController()

    static var previews: some View {
        LandmarkDetails(landmark: DataController().landmarks[0])
            .environmentObject(dataController)
    }
}

