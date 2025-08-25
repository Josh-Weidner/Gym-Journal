//
//  Movement.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import Foundation

struct Movement: Identifiable {
    var id: Int
    var name: String
    var muscleGroupId: Int
    var muscleGroup: MuscleGroup {
        MuscleGroup.exampleData.first(where: { $0.id == muscleGroupId })!
    }
}
