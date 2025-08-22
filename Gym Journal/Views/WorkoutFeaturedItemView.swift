//
//  WorkoutFeaturedItemView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/21/25.
//

import SwiftUI

struct WorkoutFeaturedItemView: View {
    let workout: Workout
    let muscleGroup: MuscleGroup
    
    var body: some View {
        Image(decorative: muscleGroup.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .clipped()
            .backgroundExtensionEffect()
            .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.7), .black.opacity(0.1)]),
                        startPoint: .bottom,
                        endPoint: .center
                    )
                )
            .overlay(alignment: .bottom) {
                VStack {
                    Text("Today's Workout", comment: "Big headline in the main image of featured workouts.")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .opacity(0.8)
                    Text(muscleGroup.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Button("Record Workout") {}
                        .glassEffect()
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom, Constants.learnMorePadding)
                }
                .padding([.bottom], Constants.learnMoreBottomPadding)
            }
    }
}

#Preview {
    let previewWorkout: Workout = Workout(id: 1, date: "Today", primaryMuscleGroupId: 3)
    let previewMuscleGroup: MuscleGroup = MuscleGroup(id: 3, name: "Leg Day", image: "LegDay")
    WorkoutFeaturedItemView(workout: previewWorkout, muscleGroup: previewMuscleGroup)
        .frame(height: 400.0)
}
