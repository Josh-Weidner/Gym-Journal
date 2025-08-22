/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that adds a gradient over an image to aid legibility for a text overlay.
*/

import SwiftUI

/// A view that adds a gradient over an image to improve legibility for a text overlay.
struct ReadabilityRoundedRectangle: View {
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .foregroundStyle(.clear)
            .containerRelativeFrame(.vertical)
            .clipped()
    }
}

