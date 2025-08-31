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
            id: 1,
            name: "Today",
            date: "Today",
            primaryMuscleGroupId: 3
        ),
        
        Workout(
            id: 2,
            name: "Yesterday",
            date: "Yesterday",
            primaryMuscleGroupId: 2
        ),
        
        Workout(
            id: 3,
            name: "Tuesday",
            date: "Tuesday",
            primaryMuscleGroupId: 1
        )
    ]
}
