//
//  CalculationView.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-15.
//

import SwiftUI
import CoreLocation

struct CalculationView: View {
    @State private var showingLandmarkList = false
    @State private var location1 = ""
    @State private var location2 = ""
    @State private var distanceInKilometers: CLLocationDistance = 0.0

    var body: some View {
        NavigationView {
            VStack {
                Image("distance")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()

                TextField("Enter Location 1", text: $location1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Enter Location 2", text: $location2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    calculateDistance()
                }) {
                    Text("Calculate Distance")
                        .foregroundColor(.blue)
                }
                .padding()

                Text(String(format: "Distance in kilometers: %.2f", distanceInKilometers / 1000))
                    .padding()
            }
            .navigationBarTitle("Calculate Distance")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingLandmarkList.toggle()
                    } label: {
                        Label("Landmark List", systemImage: "chevron.left")
                    }
                }
            }
            .sheet(isPresented: $showingLandmarkList) {
                LandmarkList()
            }
        }
    }

    func calculateDistance() {
        let geocoder = CLGeocoder()

        geocoder.geocodeAddressString(location1) { placemarks1, error in
            guard let placemark1 = placemarks1?.first?.location else {
                print("Error geocoding Location 1: \(error?.localizedDescription ?? "")")
                return
            }

            geocoder.geocodeAddressString(location2) { placemarks2, error in
                guard let placemark2 = placemarks2?.first?.location else {
                    print("Error geocoding Location 2: \(error?.localizedDescription ?? "")")
                    return
                }

                let distance = placemark1.distance(from: placemark2)
                distanceInKilometers = distance
            }
        }
    }
}


struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView()
    }
}
