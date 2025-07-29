//
//  ChallengeView.swift
//  Mundeer
//
//  Created by saroj kumar sah on 14/05/25.
//

import Foundation
import SwiftUI

struct ChallengeView: View {
    @State private var activeChallenges = [
        Challenge(title: "No Plastic Week", description: "Avoid single-use plastics for 7 days.", progress: 0.6),
        Challenge(title: "Commute Green", description: "Use eco-transport 5 times this week.", progress: 0.4),
        Challenge(title: "Power Saver", description: "Reduce energy use for 3 days.", progress: 0.8)
    ]

    @State private var showJoinSheet = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("🌱 Community Challenges")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)

                    ForEach(activeChallenges) { challenge in
                        ChallengeCard(challenge: challenge)
                    }

                    Button(action: {
                        showJoinSheet = true
                    }) {
                        Text("➕ Join New Challenge")
                            .font(.subheadline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.85))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
                .navigationTitle("🎯 Challenges")
                .sheet(isPresented: $showJoinSheet) {
                    JoinChallengeView()
                }
            }
        }
    }
}
#Preview {
    ChallengeView()
}
