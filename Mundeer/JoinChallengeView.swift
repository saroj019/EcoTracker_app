import SwiftUI

struct JoinChallengeView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Available Challenges")) {
                    Text("🌿 Zero Waste Week")
                    Text("🚲 5km Daily Commute")
                    Text("💡 Save 1hr Energy Daily")
                    Text("🌳 Plant a Tree Challenge")
                    Text("🚿 5-Minute Showers Only")
                    Text("🍃 Meat-Free Monday")
                    Text("📦 Reuse & Recycle Plastic")
                    Text("👣 10,000 Steps a Day")
                    Text("🛒 Carry Your Own Bag")
                    Text("☀️ Solar Hour – No Electricity Use")
                }
            }
            .navigationTitle("Join Challenge")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Close") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
        }
    }
}
