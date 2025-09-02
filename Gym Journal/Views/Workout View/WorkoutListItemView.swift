//
//  WorkoutListItemView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/19/25.
//

import SwiftUI
import SwiftData

struct WorkoutListItemView: View {
    let workout: Workout
    
    var body: some View {
        NavigationLink(destination: WorkoutDetailView(workout: workout)) {
            ZStack {
                Image(workout.muscleGroup.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .overlay {
                        ReadabilityRoundedRectangle()
                    }
                    .clipped()
                    .cornerRadius(Constants.cornerRadius)
                    .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [.black.opacity(0.7), .black.opacity(0.1)]),
                                startPoint: .bottom,
                                endPoint: .center
                            )
                            .cornerRadius(Constants.cornerRadius)
                        )
                    .overlay(alignment: .bottom) {
                        Text(workout.date.relativeDescription())
                            .font(.title3).fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .padding(.bottom)
                    }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    let previewMuscleGroup = MuscleGroup(id: 1, name: "Back")
    let previewWorkout = Workout(name:"Yesterday", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, muscleGroup: previewMuscleGroup)
    WorkoutListItemView(workout: previewWorkout)
        .modelContainer(for: Workout.self, inMemory: true)
        .frame(width: 252.0, height: 180.0)
}
