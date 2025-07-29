import SwiftUI

struct LeaderboardView: View {
    enum LeaderboardCategory: String, CaseIterable {
        case local = "Local"
        case global = "Global"
        case friends = "Friends"
    }

    struct Leader: Identifiable {
        let id = UUID()
        let name: String
        let city: String
        let points: Int
        let rank: Int
    }

    @State private var selectedCategory: LeaderboardCategory = .local

    let localLeaders: [Leader] = [
        Leader(name: "Raj", city: "Pune", points: 310, rank: 1),
        Leader(name: "Ananya", city: "Bangalore", points: 300, rank: 2),
        Leader(name: "Ravi", city: "Kolkata", points: 290, rank: 3),
        Leader(name: "Simran", city: "Amritsar", points: 275, rank: 4),
        Leader(name: "Zoya", city: "Lucknow", points: 265, rank: 5)
    ]

    let globalLeaders: [Leader] = [
        Leader(name: "Honey", city: "Delhi", points: 420, rank: 1),
        Leader(name: "Raftaar", city: "Chennai", points: 390, rank: 2),
        Leader(name: "Ikka", city: "Hyderabad", points: 370, rank: 3),
        Leader(name: "Badshah", city: "Haryana", points: 350, rank: 4),
        Leader(name: "Lil Golu", city: "Noida", points: 340, rank: 5),
        Leader(name: "Neha", city: "Mumbai", points: 325, rank: 6)
    ]

    let friendLeaders: [Leader] = [
        Leader(name: "Meera", city: "Indore", points: 240, rank: 1),
        Leader(name: "Yash", city: "Nagpur", points: 230, rank: 2),
        Leader(name: "Pooja", city: "Surat", points: 220, rank: 3),
        Leader(name: "Kabir", city: "Ahmedabad", points: 210, rank: 4),
        Leader(name: "Diya", city: "Bhopal", points: 200, rank: 5)
    ]

    var selectedLeaders: [Leader] {
        switch selectedCategory {
        case .local:
            return localLeaders
        case .global:
            return globalLeaders
        case .friends:
            return friendLeaders
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("Leaderboard Category", selection: $selectedCategory) {
                    ForEach(LeaderboardCategory.allCases, id: \.self) { category in
                        Text(category.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List {
                    ForEach(selectedLeaders) { leader in
                        HStack(spacing: 12) {
                            Text("#\(leader.rank)")
                                .font(.title3)
                                .bold()
                                .frame(width: 40)

                            VStack(alignment: .leading) {
                                Text(leader.name)
                                    .font(.headline)
                                Text(leader.city)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Text("\(leader.points) pts")
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("🌟 Leaderboard")
        }
    }
}
