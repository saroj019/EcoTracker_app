//
//  MainView.swift
//  Mundeer
//
//  Created by saroj kumar sah on 16/05/25.
//

import SwiftUI

struct MainView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            WellnessView() // New combined mental wellness hub
                    .tabItem {
                        Label("Wellness", systemImage: "heart.circle.fill")
                    }
            AchievementsView()
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Achievements")
                }

            UploadView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Upload")
                }

            LeaderboardView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("Leaderboard")
                }

            RewardsView()
                .tabItem {
                    Image(systemName: "gift.fill")
                    Text("Rewards")
                }
        }
    }
}
#Preview {
    MainView()
}
