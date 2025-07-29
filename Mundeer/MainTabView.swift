//
//  MainTabView.swift
//  Mundeer
//
//  Created by saroj kumar sah on 16/05/25.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
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
    MainTabView()
}
