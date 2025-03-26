//
//  Training.swift
//  Pinnacle
//
//  Created by D K on 10.03.2025.
//

import Foundation

struct Training: Codable, Identifiable {
    var id = UUID()
    let title: String
    let date: String
    let time: String
    let location: String
    let coachName: String
    let description: String
    let itemsToBring: String
    var icon: String?
}
