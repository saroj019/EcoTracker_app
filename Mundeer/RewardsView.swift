import SwiftUI

struct RewardsView: View {
    struct Reward: Identifiable {
        let id = UUID()
        let title: String
        let description: String
        let pointsRequired: Int
        let image: String
    }

    @State private var userPoints = 300

    let rewards: [Reward] = [
        Reward(title: "10% Off Eco Store", description: "Use this coupon for discounts at our partner eco store.", pointsRequired: 100, image: "cart"),
        Reward(title: "Plant a Tree", description: "We plant a tree in your name via our NGO partner.", pointsRequired: 80, image: "leaf"),
        Reward(title: "Reusable Water Bottle", description: "Redeem a high-quality, eco-friendly water bottle.", pointsRequired: 150, image: "drop"),
        Reward(title: "Organic Tote Bag", description: "Stylish and sustainable bag for everyday use.", pointsRequired: 90, image: "bag"),
        Reward(title: "Eco Workshop Pass", description: "Free entry to sustainability workshop in your city.", pointsRequired: 130, image: "graduationcap"),
        Reward(title: "Amazon Gift Voucher ₹250", description: "Get an Amazon e-voucher to shop sustainably.", pointsRequired: 200, image: "gift"),
        Reward(title: "Free Trip to Eco Park", description: "Enjoy a guided eco trip with nature experts.", pointsRequired: 300, image: "leaf.arrow.circlepath"),
        Reward(title: "Solar Lantern", description: "Redeem a solar-powered lantern perfect for outdoor use.", pointsRequired: 170, image: "sun.max"),
        Reward(title: "Compost Bin Kit", description: "Start composting at home with this DIY kit.", pointsRequired: 140, image: "tray"),
        Reward(title: "Eco Warrior Badge", description: "Special badge for achieving 500 points milestone.", pointsRequired: 0, image: "star.fill") // Free badge
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("🎁 Your Eco Points: \(userPoints)")
                    .font(.headline)
                    .padding(.horizontal)

                List(rewards) { reward in
                    HStack(alignment: .top, spacing: 16) {
                        Image(systemName: reward.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(8)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(10)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(reward.title)
                                .font(.headline)
                            Text(reward.description)
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("Points: \(reward.pointsRequired)")
                                .font(.caption2)
                                .foregroundColor(reward.pointsRequired <= userPoints ? .green : .red)
                        }

                        Spacer()

                        if reward.pointsRequired <= userPoints {
                            Button("Redeem") {
                                userPoints -= reward.pointsRequired
                            }
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        } else {
                            Text("Not enough points")
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Available Rewards")
        }
    }
}
