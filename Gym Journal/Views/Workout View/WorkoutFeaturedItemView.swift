//
//  WorkoutFeaturedItemView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/21/25.
//

import SwiftUI
import SwiftData

struct WorkoutFeaturedItemView: View {
    let workout: Workout
    
    var body: some View {
        Image(decorative: workout.muscleGroup.name)
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
                    Text(workout.muscleGroup.name)
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
    let previewMuscleGroup = MuscleGroup(id: 1, name: "Back")
    let previewWorkout: Workout = Workout(name: "Today", date: Date(), muscleGroup: previewMuscleGroup)
    WorkoutFeaturedItemView(workout: previewWorkout)
        .modelContainer(for: Workout.self, inMemory: true)
        .frame(height: 400.0)
}
