import SwiftUI

struct GratitudeJournalView: View {
    @State private var entry = ""
    @State private var lastSavedEntry = ""
    @State private var savedDate = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    Text("🌟 Daily Gratitude Journal")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    Text("“Gratitude turns what we have into enough.”")
                        .italic()
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    if !savedDate.isEmpty {
                        VStack(spacing: 6) {
                            Text("📅 Last Entry on \(savedDate)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text("\"\(lastSavedEntry)\"")
                                .font(.body)
                                .italic()
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("📝 What are you grateful for today?")
                            .font(.headline)

                        TextEditor(text: $entry)
                            .frame(height: 150)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.green.opacity(0.6), lineWidth: 1)
                            )
                    }
                    .padding(.horizontal)

                    Button(action: {
                        saveEntry()
                    }) {
                        Text("💾 Save Entry")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }

                    Spacer()
                }
                .padding(.top)
            }
            .onAppear(perform: loadLastEntry)
            .navigationTitle("Gratitude Journal")
        }
    }

    func saveEntry() {
        guard !entry.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        let date = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .none)
        UserDefaults.standard.set(entry, forKey: "lastGratitudeEntry")
        UserDefaults.standard.set(date, forKey: "lastGratitudeDate")
        lastSavedEntry = entry
        savedDate = date
        entry = ""
    }

    func loadLastEntry() {
        lastSavedEntry = UserDefaults.standard.string(forKey: "lastGratitudeEntry") ?? ""
        savedDate = UserDefaults.standard.string(forKey: "lastGratitudeDate") ?? ""
    }
}

#Preview {
    GratitudeJournalView()
}
