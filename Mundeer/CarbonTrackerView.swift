import SwiftUI

struct CarbonTrackerView: View {
    @State private var carbonTracker = CarbonTracker()  // Initialize the tracker

    // Sample actions for testing
    let ecoActions = [
        EcoAction(title: "Biked", co2Saved: 0.5),
        EcoAction(title: "Planted Tree", co2Saved: 1.0),
        EcoAction(title: "Public Transport", co2Saved: 0.7),
        EcoAction(title: "Recycled", co2Saved: 0.3),
        EcoAction(title: "Saved Energy", co2Saved: 0.4)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("🌍 Carbon Tracker")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)

                    // Total CO₂ Saved
                    Text("Total CO₂ Saved: \(String(format: "%.1f", carbonTracker.totalCO2Saved)) kg")
                        .font(.title)
                        .bold()
                        .padding()

                    // List of Actions Taken
                    VStack(alignment: .leading, spacing: 12) {
                        Text("🔋 Eco Actions")
                            .font(.headline)

                        ForEach(ecoActions, id: \.title) { action in
                            Button(action: {
                                carbonTracker.logAction(action: action)
                            }) {
                                HStack {
                                    Text(action.title)
                                        .font(.subheadline)
                                    Spacer()
                                    Text("\(action.co2Saved, specifier: "%.1f") kg CO₂")
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Reset Button
                    Button(action: {
                        carbonTracker.reset()
                    }) {
                        Text("Reset Tracker")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
                .navigationTitle("CO₂ Savings Tracker")
            }
        }
    }
}
