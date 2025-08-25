//
//  MuscleGroup.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/20/25.
//

import Foundation

struct MuscleGroup: Identifiable {
    var id: Int
    var name: String
    
    var image: String {
        return "\(id)"
    }
}
