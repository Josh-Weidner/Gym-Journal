//
//  Workout.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/20/25.
//

import Foundation

struct Workout: Identifiable {
    var id: Int
    var date: String
    var primaryMuscleGroupId: Int
    var muscleGroup: MuscleGroup {
        MuscleGroup.exampleData.first(where: { $0.id == primaryMuscleGroupId }) ?? MuscleGroup.exampleData[0]
    }
}
