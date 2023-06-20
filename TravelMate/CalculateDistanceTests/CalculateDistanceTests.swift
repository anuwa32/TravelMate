//
//  CalculateDistanceTests.swift
//  CalculateDistanceTests
//
//  Created by anupriya on 2023-06-15.
//

import XCTest
import CoreLocation
@testable import MyLandmarks

class CalculationViewTests: XCTestCase {
    func testCalculateDistance() {
        let view = CalculationView()
        
        view.location1 = "Kandy"
        view.location2 = "Colombo"
        
        view.calculateDistance()
        
        XCTAssertEqual(view.distanceInKilometers, 94.30, accuracy: 1000.0)
    }
}
