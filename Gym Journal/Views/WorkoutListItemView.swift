//
//  WorkoutListItemView.swift
//  Gym Journal
//
//  Created by Josh Weidner on 8/19/25.
//

import SwiftUI

struct WorkoutListItemView: View {
    let workout: String = "Yesterday"
    
    var body: some View {
        Image("BackDay")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .overlay {
                ReadabilityRoundedRectangle()
            }
            .clipped()
            .cornerRadius(Constants.cornerRadius)
            .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [.black.opacity(0.7), .black.opacity(0.1)]),
                        startPoint: .bottom,
                        endPoint: .center
                    )
                    .cornerRadius(Constants.cornerRadius)
                )
            .overlay(alignment: .bottom) {
                Text(workout)
                    .font(.title3).fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom)
            }
    }
}

#Preview {
    WorkoutListItemView()
        .frame(width: 252.0, height: 180.0)
}
