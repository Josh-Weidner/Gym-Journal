//
//  Workout.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/20/25.
//

import Foundation
import SwiftData

@Model
final class Workout {
    var name: String
    var date: Date
    
    @Relationship
    var muscleGroup: MuscleGroup
    
    init(name: String, date: Date, muscleGroup: MuscleGroup) {
        self.name = name
        self.date = date
        self.muscleGroup = muscleGroup
    }
}
