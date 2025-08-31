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
    @Query private var workouts: [Workout]

    var body: some View {
        NavigationSplitView {
            List {
                
                ForEach(workouts) { workout in
                    NavigationLink {
                        Text("Item at \(workout.date, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(workout.date, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newWorkout = Workout(name: "Today's workout", date: Date(), muscleGroup: MuscleGroup(id: 1, name: "Chest"))
            modelContext.insert(newWorkout)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(workouts[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Workout.self, inMemory: true)
}
