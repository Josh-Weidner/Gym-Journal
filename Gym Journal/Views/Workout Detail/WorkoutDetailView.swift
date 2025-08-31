//
//  WorkoutDetailView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/24/25.
//

import SwiftUI

struct WorkoutDetailView: View {
    @Environment(ModelData.self) private var modelData
    
    let workout: Workout
    
    var body: some View {
        Text(workout.name)
    }
}

#Preview {
    @Previewable @State var modelData = ModelData()
    let previewWorkout: Workout = Workout(id: 1, name: "Today", date: "Today", primaryMuscleGroupId: 3)
    
    WorkoutDetailView(workout: previewWorkout)
        .environment(ModelData())
}
