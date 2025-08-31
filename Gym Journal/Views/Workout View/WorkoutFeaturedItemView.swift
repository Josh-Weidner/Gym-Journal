//
//  WorkoutFeaturedItemView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/21/25.
//

import SwiftUI

struct WorkoutFeaturedItemView: View {
    @Environment(ModelData.self) private var modelData
    let workout: Workout
    
    var body: some View {
        Image(decorative: workout.muscleGroup.image)
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
    let previewWorkout: Workout = Workout(id: 1, name: "Today", date: "Today", primaryMuscleGroupId: 3)
    WorkoutFeaturedItemView(workout: previewWorkout)
        .environment(ModelData())
        .frame(height: 400.0)
}
