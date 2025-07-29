//
//  ChallengeCard.swift
//  Mundeer
//
//  Created by saroj kumar sah on 14/05/25.
//

import Foundation
import SwiftUI

struct ChallengeCard: View {
    var challenge: Challenge

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(challenge.title)
                .font(.headline)
            Text(challenge.description)
                .font(.subheadline)
                .foregroundColor(.gray)

            ProgressView(value: challenge.progress)
                .accentColor(.green)

            Text("\(Int(challenge.progress * 100))% Completed")
                .font(.caption)
                .foregroundColor(.green)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
