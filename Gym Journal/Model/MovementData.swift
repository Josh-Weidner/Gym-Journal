//
//  MovementData.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation

let backGroup = MuscleGroup(id: 1, name: "Back")
let chestGroup = MuscleGroup(id: 2, name: "Chest")
let legsGroup = MuscleGroup(id: 3, name: "Legs")

extension Movement {
    @MainActor static let exampleData = [
        Movement(
            id: 1,
            name: "Bench Press",
            muscleGroup: backGroup
        ),
        
        Movement(
            id: 2,
            name: "Bar Bell Row",
            muscleGroup: backGroup
        ),
        
        Movement(
            id: 3,
            name: "Squat",
            muscleGroup: backGroup
        )
    ]
}
