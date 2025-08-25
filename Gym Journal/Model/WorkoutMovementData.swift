//
//  WorkoutMovementData.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation

extension WorkoutMovement {
    @MainActor static let exampleData = [
        WorkoutMovement(
            id: 1,
            order: 1,
            movementId: 1,
            workoutId: 3,
            sets: 5,
            repitions: 5,
            weight: 185
        ),
        
        WorkoutMovement(
            id: 2,
            order: 2,
            movementId: 2,
            workoutId: 3,
            sets: 3,
            repitions: 12,
            weight: 100
        ),
        
        WorkoutMovement(
            id: 3,
            order: 3,
            movementId: 3,
            workoutId: 3,
            sets: 5,
            repitions: 5,
            weight: 225
        )
    ]
}
