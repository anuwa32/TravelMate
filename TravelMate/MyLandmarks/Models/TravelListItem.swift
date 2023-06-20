//
//  TravelListItem.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-14.
//

import Foundation

struct TravelListItem: Codable, Identifiable {
    
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
