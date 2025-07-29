//
//  ProgressView.swift
//  Mundeer
//
//  Created by saroj kumar sah on 16/05/25.
//

import Foundation
import SwiftUI
struct ProgressViewSection: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                StatCard(title: "CO₂ Saved", value: "12.3 kg", icon: "leaf.fill", color: .green)
                StatCard(title: "Eco Streak", value: "7 days", icon: "flame.fill", color: .orange)
                StatCard(title: "Total Actions", value: "22", icon: "checkmark.circle.fill", color: .blue)

                Text("Unlocked Badges")
                    .font(.headline)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        BadgeView(title: "Tree Planter", image: "tree.fill")
                        BadgeView(title: "Recycle Champ", image: "arrow.2.circlepath.circle.fill")
                        BadgeView(title: "Green Commuter", image: "bicycle.circle.fill")
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.horizontal)
        }
    }
}
