import SwiftUI
// if using Firebase

@main
struct EcoTrackApp: App {
    init() {
        // Optional: FirebaseApp.configure() if you're using Firebase
    }

    var body: some Scene {
        WindowGroup {
            SplashView()  // ✅ this decides what to show
        }
    }
}
