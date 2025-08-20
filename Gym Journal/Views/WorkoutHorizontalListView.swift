//
//  WorkoutHorizontalListView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/19/25.
//

import SwiftUI

struct WorkoutHorizontalListView: View {
    let workoutList: [String] = ["Yesterday", "Tuesday", "Monday"]
    
    
    var body: some View {
        ScrollView(.horizontal, showIndicators: false) {
            LazyHStack(spacing: .Constants.standardPadding) {
                Spacer()
                    .frame(width:
                            Constants.standardPadding)
                ForEach(workoutList) { workout in
                    NavigationLink(value: workout){
                    
                }
            }
        }
    }
}

#Preview {
    WorkoutHorizontalListView()
}
