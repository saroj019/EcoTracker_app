import SwiftUI

struct LogActionView: View {
    @State private var co2Saved: Double = 0.0

    let ecoActions: [(String, Double)] = [
        ("🚲 Biked", 1.0),
        ("🌳 Planted Tree", 2.5),
        ("🚍 Public Transport", 1.2),
        ("♻️ Recycled", 0.8),
        ("💡 Saved Energy", 1.1),
        ("🛍️ Used Cloth Bag", 0.4),
        ("🚿 Shorter Shower", 0.6),
        ("🍃 Ate Plant-Based Meal", 0.9),
        ("🔌 Unplugged Devices", 0.3),
        ("🌞 Used Solar Power", 2.0),
        ("🚯 Picked Up Litter", 0.2),
        ("🧺 Washed with Cold Water", 0.5),
        ("👕 Air-Dried Clothes", 0.7),
        ("📦 Reused Packaging", 0.3),
        ("📝 Digital Notes Instead of Paper", 0.1),
        ("🧴 Used Eco-friendly Products", 0.4),
        ("📱 Recycled Electronics", 1.5),
        ("🌐 Remote Work", 1.3),
        ("👣 Walked Instead of Driving", 1.0),
        ("🥤 Used Reusable Bottle", 0.2),
        ("📚 Donated Books", 0.4),
        ("🪴 Home Gardening", 1.2),
        ("🧽 Natural Cleaning Products", 0.5),
        ("📦 Ordered Minimal Packaging", 0.6),
        ("🔄 Swapped Clothes", 0.8),
        ("🎒 Used Reusable Backpack", 0.3),
        ("🌧️ Collected Rainwater", 1.0),
        ("🪛 Repaired Instead of Replacing", 1.1),
        ("🧑‍🤝‍🧑 Shared Commute", 1.4),
        ("🧃 Recycled Tetra Packs", 0.7)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    Text("📝 Log Your Eco Actions")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.top)

                    Text("Track your eco-friendly actions and see how much CO₂ you save!")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.bottom)

                    ForEach(ecoActions, id: \.0) { action in
                        ActionButton(label: action.0, co2: action.1) {
                            co2Saved += action.1
                        }
                    }

                    Text("Total CO₂ Saved: \(co2Saved, specifier: "%.1f") kg")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                        .foregroundColor(.green)
                        .padding(.top)
                }
                .padding()
            }
            .navigationTitle("Log Eco Action")
        }
    }
}

#Preview{
    LogActionView()
}
