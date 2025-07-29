//
//  ActionButton.swift
//  Mundeer
//
//  Created by saroj kumar sah on 16/05/25.
//

import Foundation
import SwiftUI
struct ActionButton: View {
    var label: String
    var co2: Double
    var onTap: () -> Void

    var body: some View {
        Button(action: {
            onTap()
        }) {
            HStack {
                Text(label)
                    .font(.title3)
                    .padding()
                    .background(Capsule().fill(Color.blue))
                    .foregroundColor(.white)

                Spacer()

                Text("+\(co2, specifier: "%.1f") kg CO₂")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(12)
        }
        .padding(.vertical, 4)
    }
}
