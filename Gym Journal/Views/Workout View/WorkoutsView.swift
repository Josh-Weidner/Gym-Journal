//
//  WorkoutsView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/21/25.
//

import SwiftUI
import SwiftData

struct WorkoutsView: View {
    @Environment(ModelData.self) private var modelData
    @Environment(\.modelContext) private var modelContext
    @Query private var workouts: [Workout]
    
    @State private var isPresentingAddWorkout = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: Constants.standardPadding) {
                    
                    if let firstWorkout = modelData.workouts.first {
                        WorkoutFeaturedItemView(workout: firstWorkout)
                            .flexibleHeaderContent()
                            .environment(modelData)
                            .modelContainer(for: Workout.self)
                    }
                    
                    Group {
                        CategoryTitleView(title: "Previous Workouts")
                        WorkoutHorizontalListView(workoutList: workouts)
                            .containerRelativeFrame(.vertical) { height, _ in
                                let proposedHeight = height * Constants.landmarkListPercentOfHeight
                                return max(proposedHeight, Constants.landmarkListMinimumHeight)
                            }
                    }
                }
            }
            .flexibleHeaderScrollView()
            .ignoresSafeArea(.keyboard)
            .ignoresSafeArea(edges: .top)
            .toolbar {
                ToolbarItem {
                    Button(action: { isPresentingAddWorkout = true }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddWorkout) {
                AddWorkoutView(isPresented: $isPresentingAddWorkout)
            }
        }
    }
}
    
private struct CategoryTitleView: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .padding(.top, Constants.titleTopPadding)
            .padding(.bottom, Constants.titleBottomPadding)
            .padding(.leading, Constants.leadingContentInset)
    }
}

#Preview {
    @Previewable @State var modelData = ModelData()
    
    WorkoutsView()
        .modelContainer(for: Workout.self, inMemory: true)
        .environment(modelData)
        .onGeometryChange(for: CGSize.self) { geometry in
            geometry.size
        } action: {
            modelData.windowSize = $0
        }
}
