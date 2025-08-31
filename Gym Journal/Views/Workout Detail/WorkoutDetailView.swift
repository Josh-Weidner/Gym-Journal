//
//  WorkoutDetailView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import SwiftUI
import SwiftData

struct WorkoutDetailView: View {
    let workout: Workout
    
    var body: some View {
        Text(workout.name)
    }
}

#Preview {
    let firstMuscleGroup = MuscleGroup(id: 1, name: "Back")
    
    // Create a sample Workout directly in the preview
    let sampleWorkout = Workout(
        name: "Chest Day",
        date: Date(),
        muscleGroup: firstMuscleGroup
    )
    
    WorkoutDetailView(workout: sampleWorkout)
        .modelContainer(for: Workout.self, inMemory: true)
}

