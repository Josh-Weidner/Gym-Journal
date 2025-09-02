//
//  WorkoutHorizontalListView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/19/25.
//

import SwiftUI
import SwiftData

struct WorkoutHorizontalListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [Workout]
    
    let workoutList: [Workout]
    var muscleGroups: [MuscleGroup] = MuscleGroup.exampleData
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: Constants.standardPadding) {
                    Spacer()
                        .frame(width:
                                Constants.standardPadding)
                    ForEach(workoutList) {workout in
                        WorkoutListItemView(workout: workout)
                            .aspectRatio(Constants.landmarkListItemAspectRatio, contentMode: .fill)
                    }
                }            
            }
        }
    }
}

#Preview {
    let firstMuscleGroup = MuscleGroup(id: 1, name: "Back")
    let secondMuscleGroup = MuscleGroup(id: 2, name: "Chest")
    let thirdMuscleGroup = MuscleGroup(id: 3, name: "Legs")
    let firstWorkout: Workout = Workout(name: "Yesterday", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, muscleGroup: firstMuscleGroup)
    let secondWorkout: Workout = Workout(name: "Tuesday", date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, muscleGroup: secondMuscleGroup)
    let thirdWorkout: Workout = Workout(name: "Monday", date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, muscleGroup: thirdMuscleGroup)
    let workoutList: [Workout] = [firstWorkout, secondWorkout, thirdWorkout]
    WorkoutHorizontalListView(workoutList: workoutList)
        .environment(ModelData())
        .frame(height: 180.0)
}
