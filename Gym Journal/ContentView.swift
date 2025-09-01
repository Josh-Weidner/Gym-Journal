//
//  ContentView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(ModelData.self) private var modelData
    @Query private var workouts: [Workout]

    var body: some View {
        WorkoutsView()
            .environment(modelData)
            .modelContainer(for: Workout.self, inMemory: true)
            .onGeometryChange(for: CGSize.self) { geometry in
                geometry.size
            } action: {
                modelData.windowSize = $0
            }
    }
        
}

#Preview {
    @Previewable @State var modelData = ModelData()
    
    ContentView()
        .environment(modelData)
        .modelContainer(for: Workout.self, inMemory: true)
}
