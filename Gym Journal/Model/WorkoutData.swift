//
//  WorkoutData.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation

let backGroup = MuscleGroup(id: 1, name: "Back")
let chestGroup = MuscleGroup(id: 2, name: "Chest")
let legsGroup = MuscleGroup(id: 3, name: "Legs")

extension Workout {
    @MainActor static let exampleData = [
        Workout(
            name: "Today",
            date: Date(),
            muscleGroup: backGroup
        ),
        
        Workout(
            name: "Yesterday",
            date: Date(),
            muscleGroup: chestGroup
        ),
        
        Workout(
            name: "Tuesday",
            date: Date(),
            muscleGroup: legsGroup
        )
    ]
}
