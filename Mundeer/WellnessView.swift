import SwiftUI

struct WellnessView: View {
    @State private var expandedSection: String? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {

                    WellnessCard(title: "🧘 Mood Tracker", isExpanded: expandedSection == "Mood") {
                        MoodTrackerView()
                    }
                    .onTapGesture {
                        withAnimation {
                            expandedSection = expandedSection == "Mood" ? nil : "Mood"
                        }
                    }

                    WellnessCard(title: "📓 Gratitude Journal", isExpanded: expandedSection == "Gratitude") {
                        GratitudeJournalView()
                    }
                    .onTapGesture {
                        withAnimation {
                            expandedSection = expandedSection == "Gratitude" ? nil : "Gratitude"
                        }
                    }

                    WellnessCard(title: "🌬️ Breathing Exercise", isExpanded: expandedSection == "Breathing") {
                        BreathingExerciseView()
                    }
                    .onTapGesture {
                        withAnimation {
                            expandedSection = expandedSection == "Breathing" ? nil : "Breathing"
                        }
                    }

                    WellnessCard(title: "🔊 Affirmations", isExpanded: expandedSection == "Affirmations") {
                        AffirmationsView()
                    }
                    .onTapGesture {
                        withAnimation {
                            expandedSection = expandedSection == "Affirmations" ? nil : "Affirmations"
                        }
                    }

                    WellnessCard(title: "🌿 Nature Sounds", isExpanded: expandedSection == "Nature") {
                        NatureSoundPlayerView()
                    }
                    .onTapGesture {
                        withAnimation {
                            expandedSection = expandedSection == "Nature" ? nil : "Nature"
                        }
                    }

                    // 🚀 Navigation to YogaView on tap
                    NavigationLink(destination: YogaView()) {
                        HStack {
                            Text("🧘‍♀️ Yoga")
                                .font(.headline)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle("Mental Wellness")
        }
    }
}

#Preview {
    WellnessView()
}
