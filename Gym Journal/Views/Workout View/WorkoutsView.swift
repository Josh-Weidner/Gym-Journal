//
//  WorkoutsView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/21/25.
//

import SwiftUI

struct WorkoutsView: View {
    @Environment(ModelData.self) private var modelData
    
    let workoutList: [Workout] = [
        Workout(id: 1, date: "Yesterday", primaryMuscleGroupId: 1),
        Workout(id: 2, date: "Tuesday", primaryMuscleGroupId: 2),
        Workout(id: 3, date: "Monday", primaryMuscleGroupId: 3)]
    var featuredWorkout: Workout = Workout(id: 1, date: "Today", primaryMuscleGroupId: 3)
    var featuredMuscleGroup: MuscleGroup = MuscleGroup(id: 3, name: "Leg Day", image: "LegDay")
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: Constants.standardPadding) {

                WorkoutFeaturedItemView(workout: featuredWorkout, muscleGroup: featuredMuscleGroup)
                    .flexibleHeaderContent()


                Group {
                    CategoryTitleView(title: "Previous Workouts")
                        WorkoutHorizontalListView(workoutList: workoutList)
                            .containerRelativeFrame(.vertical) { height, axis in
                                let proposedHeight = height * Constants.landmarkListPercentOfHeight
                                if proposedHeight > Constants.landmarkListMinimumHeight {
                                    return proposedHeight
                                }
                                return Constants.landmarkListMinimumHeight
                            }
                }
            }
        }
        .flexibleHeaderScrollView()
        .ignoresSafeArea(.keyboard)
        .ignoresSafeArea(edges: .top)
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
        .environment(modelData)
        .onGeometryChange(for: CGSize.self) { geometry in
            geometry.size
        } action: {
            modelData.windowSize = $0
        }
}
