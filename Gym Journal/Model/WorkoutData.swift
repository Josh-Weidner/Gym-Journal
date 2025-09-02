//
//  WorkoutData.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation

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
