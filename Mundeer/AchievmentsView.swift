import SwiftUI

struct AchievementsView: View {
    @State private var selectedTab = "Progress"
    let tabs = ["Progress", "Rewards"]

    var body: some View {
        NavigationView {
            VStack {
                // Segmented Picker
                Picker("Select Tab", selection: $selectedTab) {
                    ForEach(tabs, id: \.self) { tab in
                        Text(tab).tag(tab)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Content based on selection
                if selectedTab == "Progress" {
                    ProgressViewSection()
                } else {
                    RewardsView()
                }

                Spacer()
            }
            .navigationTitle("Achievements")
        }
    }
}
