//
//  AddWorkoutView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/31/25.
//

import SwiftUI
import SwiftData

struct AddWorkoutView: View {
    @Environment(ModelData.self) private var modelData
    @Environment(\.modelContext) private var modelContext
    @Binding var isPresented: Bool
    
    @State private var name: String = ""
    @State private var selectedMuscleGroup: MuscleGroup = MuscleGroup.exampleData.first!
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Workout Name", text: $name)
                Picker("Muscle Group", selection: $selectedMuscleGroup) {
                    ForEach(modelData.muscleGroups, id: \.id) { group in
                        Text(group.name).tag(group)
                    }
                }
                .pickerStyle(.menu)

                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            .navigationTitle("New Workout")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { isPresented = false}) {
                        Label("Cancel", systemImage: "xmark")
                    }
                    .glassEffect()
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        let newWorkout = Workout(
                            name: name,
                            date: Date(),
                            muscleGroup: selectedMuscleGroup,
                        )
                        modelContext.insert(newWorkout)
                        try? modelContext.save()
                        isPresented = false
                    }) {
                        Label("Save", systemImage: "checkmark")
                    }
                    .glassEffect()
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}
