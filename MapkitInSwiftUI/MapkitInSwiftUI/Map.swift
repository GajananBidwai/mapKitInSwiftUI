//
//  Map.swift
//  MapkitInSwiftUI
//
//  Created by Neosoft on 12/01/26.
//

import Foundation
// Root Model
struct TopicsResponse: Codable {
    let topics: [Topic]
}

// Topic Model
struct Topic: Codable, Identifiable {
    let id: Int
    let name: String
}
