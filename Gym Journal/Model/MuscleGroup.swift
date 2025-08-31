//
//  MuscleGroup.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/20/25.
//

import Foundation
import SwiftData

@Model
final class MuscleGroup: Identifiable {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
