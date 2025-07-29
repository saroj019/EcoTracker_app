//
//  AffirmationsView.swift
//  Mundeer
//
//  Created by saroj kumar sah on 17/05/25.
//

import Foundation
import SwiftUI
struct AffirmationsView: View {
    let affirmations = [
        "I am doing my best.",
        "I choose to be positive.",
        "I care for the Earth and myself.",
        "Every step counts.",
        "I believe in progress, not perfection."
    ]

    var body: some View {
        VStack(spacing: 30) {
            Text("🌟 Daily Affirmation")
                .font(.title2)

            Text(affirmations.randomElement() ?? "")
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .padding()
    }
}
