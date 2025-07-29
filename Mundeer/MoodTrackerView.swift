import SwiftUI
import AVFoundation

struct MoodTrackerView: View {
    @State private var selectedMoodLabel = ""
    @State private var taskSuggestion = ""
    @State private var audioPlayer: AVAudioPlayer?
    @State private var showPopup = false
    @State private var showTask = false

    let moods: [(emoji: String, label: String, task: String, sound: String)] = [
        ("😊", "Happy", "Go ride a bicycle 🚲", "happy.mp3"),
        ("😞", "Sad", "Water your plants 🌱", "sad.mp3"),
        ("😠", "Angry", "Try deep breathing 🧘", "angry.mp3"),
        ("😌", "Relaxed", "Take a calm walk in nature 🌳", "relaxed.mp3"),
        ("😔", "Anxious", "Practice meditation or journaling 📓", "anxious.mp3")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    Text("🌈 How are you feeling today?")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.top)

                    ForEach(moods, id: \.label) { mood in
                        VStack(spacing: 8) {
                            Button(action: {
                                // Mood selected
                                selectedMoodLabel = mood.label
                                taskSuggestion = mood.task
                                playSound(named: mood.sound)
                                saveMoodLocally(mood: mood.label)

                                // Show popup briefly
                                showPopup = true
                                showTask = false
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showPopup = false
                                    showTask = true
                                }
                            }) {
                                HStack {
                                    Text("\(mood.emoji) \(mood.label)")
                                        .font(.title2)
                                        .padding()
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.15))
                                .cornerRadius(12)
                                .shadow(radius: 2)
                                .padding(.horizontal)
                            }

                            if selectedMoodLabel == mood.label {
                                if showPopup {
                                    Text("You're feeling \(mood.label)!")
                                        .font(.subheadline)
                                        .foregroundColor(.purple)
                                        .transition(.opacity)
                                }

                                if showTask {
                                    Text(taskSuggestion)
                                        .font(.body)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.green)
                                        .padding(.bottom, 8)
                                }
                            }
                        }
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Mood Tracker")
        }
    }

    func playSound(named name: String) {
        audioPlayer?.stop()

        if let url = Bundle.main.url(forResource: name.replacingOccurrences(of: ".mp3", with: ""), withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file not found: \(name)")
        }
    }

    func saveMoodLocally(mood: String) {
        UserDefaults.standard.set(mood, forKey: "lastMood")
    }
}

#Preview {
    MoodTrackerView()
}
