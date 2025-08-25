//
//  WorkoutHorizontalListView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/19/25.
//

import SwiftUI

struct WorkoutHorizontalListView: View {
    let workoutList: [Workout]
    var muscleGroups: [MuscleGroup] = MuscleGroup.exampleData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: Constants.standardPadding) {
                Spacer()
                    .frame(width:
                            Constants.standardPadding)
                ForEach(workoutList) {workout in
                    if let muscleGroup = muscleGroups.first(where: {$0.id == workout.primaryMuscleGroupId}) {
                        WorkoutListItemView(workout: workout, muscleGroup: muscleGroup)
                            .aspectRatio(Constants.landmarkListItemAspectRatio, contentMode: .fill)
                    }
                }
            }
        }
    }
}

#Preview {
    let firstWorkout: Workout = Workout(id: 1, date: "Yesterday", primaryMuscleGroupId: 1)
    let secondWorkout: Workout = Workout(id: 2, date: "Tuesday", primaryMuscleGroupId: 2)
    let thirdWorkout: Workout = Workout(id: 3, date: "Monday", primaryMuscleGroupId: 3)
    let workoutList: [Workout] = [firstWorkout, secondWorkout, thirdWorkout]
    WorkoutHorizontalListView(workoutList: workoutList)
        .frame(height: 180.0)
}
