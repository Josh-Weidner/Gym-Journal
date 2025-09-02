//
//  ModelData.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/21/25.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation
import SwiftData

@Observable @MainActor
class ModelData {
    var windowSize: CGSize = .zero
    var muscleGroups: [MuscleGroup] = []
    var workouts: [Workout] = []
    var movements: [Movement] = []
    
    init() {
        loadMuscleGroups()
        loadWorkouts()
        loadMovements()
    }
    
    func loadMuscleGroups() {
        muscleGroups = MuscleGroup.exampleData
    }
    
    func loadWorkouts() {
        workouts = Workout.exampleData
    }
    
    func loadMovements() {
        movements = Movement.exampleData
    }
}
