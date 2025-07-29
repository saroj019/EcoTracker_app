import SwiftUI
import AVFoundation

struct NatureSoundPlayerView: View {
    @State private var selectedSound = "Rain"
    @State private var audioPlayer: AVAudioPlayer?

    let sounds = [
        "Rain": "rain.wav",
        "Birds Chirping": "birds.wav",
        "Ocean Waves": "ocean.wav",
        "Night Crickets": "night.wav",
        "Morning Ambience": "morning.wav",
        "Forest Breeze": "forest.wav"
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("🎶 Relax with Nature Sounds")
                .font(.title2)
                .fontWeight(.semibold)

            Picker("Choose a Sound", selection: $selectedSound) {
                ForEach(sounds.keys.sorted(), id: \.self) { sound in
                    Text(sound)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)

            Button(action: {
                playSelectedSound()
            }) {
                Text("▶️ Play Sound")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: {
                stopSound()
            }) {
                Text("⏹ Stop Sound")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
    }

    // ✅ Function to play the selected sound
    func playSelectedSound() {
        if let fileName = sounds[selectedSound] {
            playSound(named: fileName)
        }
    }

    func playSound(named name: String) {
        audioPlayer?.stop()

        guard let url = Bundle.main.url(forResource: name.replacingOccurrences(of: ".mp3", with: "").replacingOccurrences(of: ".wav", with: ""), withExtension: name.hasSuffix(".wav") ? "wav" : "mp3") else {
            print("⚠️ Sound file not found in bundle: \(name)")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("❌ Error playing sound: \(error.localizedDescription)")
        }
    }

    func stopSound() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}
#Preview {
    NatureSoundPlayerView()
}
