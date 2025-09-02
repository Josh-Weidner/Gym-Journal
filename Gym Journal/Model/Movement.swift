//
//  Movement.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation
import SwiftData

@Model
final class Movement: Identifiable {
    var id: Int
    var name: String
    
    @Relationship
    var muscleGroup: MuscleGroup
    
    init(id: Int, name: String, muscleGroup: MuscleGroup) {
        self.id = id
        self.name = name
        self.muscleGroup = muscleGroup
    }
}
