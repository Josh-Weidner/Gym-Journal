//
//  MovementData.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation

extension Movement {
    @MainActor static let exampleData = [
        Movement(
            id: 1,
            name: "Bench Press",
            muscleGroupId: 1
        ),
        
        Movement(
            id: 2,
            name: "Bar Bell Row",
            muscleGroupId: 2
        ),
        
        Movement(
            id: 3,
            name: "Squat",
            muscleGroupId: 3
        )
    ]
}
