//
//  WorkoutMovement.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation

struct WorkoutMovement {
    var id: Int
    var order: Int
    var movementId: Int
    
    var movement: Movement {
        Movement.exampleData.first(where: { $0.id == movementId })!
    }
    
    var workoutId: Int
    
    var workout: Workout {
        Workout.exampleData.first(where: { $0.id == workoutId})!
    }
    
    var sets: Int
    var repitions: Int
    var weight: Double
}
