import SwiftUI

struct HomeView: View {
    @State private var points: Int = 120
    @State private var streak: Int = 4
    @State private var co2Saved: Double = 7.8
    
    // Dummy weather/activity data
    let temperature: Double = 27.5
    let humidity: Int = 62
    let windSpeed: Double = 10.3
    let distanceWalked: Double = 3.7
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Welcome Text
                    Text("🌍 Welcome back, Honey!")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    // Weather & Activity Section
                    WeatherSection(
                        temperature: temperature,
                        humidity: humidity,
                        windSpeed: windSpeed,
                        distanceWalked: distanceWalked
                    )
                    
                    // Stats Section
                    VStack(spacing: 12) {
                        StatCard(title: "CO₂ Saved", value: String(format: "%.1f kg", co2Saved), icon: "leaf.circle.fill", color: .green)
                        StatCard(title: "Eco Points", value: "\(points)", icon: "star.circle.fill", color: .yellow)
                        StatCard(title: "Streak", value: "\(streak) days", icon: "flame.fill", color: .orange)
                    }
                    NavigationLink(destination: YogaView()) {
                        Label("🧘 Yoga", systemImage: "figure.yoga")
                    }

                    
                    // Rewards & Navigation
                    
                    // Achievements
                    Text("🏅 Your Achievements")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            BadgeView(title: "Tree Planter", image: "tree.fill")
                            BadgeView(title: "Recycle Champ", image: "arrow.2.circlepath.circle.fill")
                            BadgeView(title: "Green Commuter", image: "bicycle.circle.fill")
                            BadgeView(title: "Energy Saver", image: "bolt.fill")
                            BadgeView(title: "Plastic Free", image: "cart.fill")
                        }
                        .padding(.horizontal)
                    }
                    
                    Divider()
                    
                    // Navigation Links
                    Group {
                        NavigationLink(destination: CarbonTrackerView()) {
                            Text("💚 Track Carbon Savings")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                                .padding(.vertical, 6)
                        }
                        
                        NavigationLink(destination: LeaderboardView()) {
                            Text("🏆 View Leaderboard")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                                .padding(.vertical, 6)
                        }
                        
                        NavigationLink(destination: ChallengeView()) {
                            Text("🎯 Join a Challenge")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                                .padding(.vertical, 6)
                        }
                        
                        NavigationLink(destination: RewardsView()) {
                            Text("🎁 Check Rewards")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                                .padding(.vertical, 6)
                        }
                        
                        NavigationLink(destination: LogActionView()) {
                            Text("📲 See your log action here ")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                                .padding(.vertical, 6)
                        }
                    }
                    
                    Divider()
                    
                    // Eco Action Feed (like Instagram)
                    VStack(alignment: .leading, spacing: 12) {
                        Text("✅ Recent Eco Actions")
                            .font(.headline)
                            .padding(.top, 10)
                            HStack {
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundColor(.green)
                                    .frame(width: 30)
                                Text("Eco action 1")
                                Spacer()
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            
                   
                        Spacer(minLength: 40) // Space for tab bar
                    }
                    .padding(.bottom, 80)
                    .padding(.horizontal)
                }
                .navigationTitle("Eco Dashboard")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                        }
                    }
                }
            }
        }
    }
}
#Preview {
   HomeView()
}
