//
//  Gym_JournalApp.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/18/25.
//

import SwiftUI
import SwiftData

@main
struct Gym_JournalApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Workout.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
                .modelContainer(for: Workout.self)
        }
        .modelContainer(sharedModelContainer)
    }
}
