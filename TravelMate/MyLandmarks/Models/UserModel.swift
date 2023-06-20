//
//  UserModel.swift
//  MyLandmarks
//
//  Created by anupriya on 2023-06-13.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
