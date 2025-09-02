//
//  dateRelativeDescription.swift
//  Gym Journal
//
//  Created by Josh Weidner on 9/1/25.
//

import Foundation

extension Date {
    func relativeDescription() -> String {
        let calendar = Calendar.current
        
        if calendar.isDateInYesterday(self) {
            return "Yesterday"
        }
        
        if let daysAgo = calendar.dateComponents([.day], from: self, to: Date()).day,
           daysAgo < 7 && daysAgo > 0 {
            // Show weekday (e.g., "Monday")
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter.string(from: self)
        }
        
        // Fallback to normal date (medium style: Jan 1, 2025)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
