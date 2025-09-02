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
    
    @State private var selectedMovement: Movement = Movement.exampleData.first!
    @State private var selectedWeight: Double = 50
    @State private var selectedReps: Int = 8
    @State private var selectedSets: Int = 3
    
    var body: some View {
        NavigationStack {
            Form {
                Section() {
                    
                    TextField("Workout Name", text: $name)
                    Picker("Muscle Group", selection: $selectedMuscleGroup) {
                        ForEach(modelData.muscleGroups, id: \.id) { group in
                            Text(group.name).tag(group)
                        }
                    }
                    .pickerStyle(.menu)

                    DatePicker("Date", selection: $date, displayedComponents: .date)
                }
                
                Section(){
                    Picker("Movement", selection: $selectedMovement) {
                        ForEach(modelData.movements, id: \.id) { group in
                            Text(group.name).tag(group)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Weight", selection: $selectedWeight) {
                        ForEach(0..<101) { i in
                            let value = Double(i) * 2.5
                            Text("\(value, specifier: "%.1f") lbs").tag(value)
                        }
                    }
                    .pickerStyle(.menu)
                }
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
                            date: date,
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
