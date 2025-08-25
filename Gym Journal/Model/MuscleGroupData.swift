//
//  MuscleGroupData.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation

extension MuscleGroup {
    @MainActor static let exampleData = [
        MuscleGroup(
            id: 1,
            name: "Chest"
        ),
        
        MuscleGroup(
            id: 2,
            name: "Back"
        ),
        
        MuscleGroup(
            id: 3,
            name: "Legs")
    ]
}
