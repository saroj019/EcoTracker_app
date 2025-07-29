import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var scaleEffect = 0.6
    @AppStorage("isLoggedIn") private var isLoggedIn = false



    var body: some View {
        if isActive {
            LoginPage()
        } else {
            VStack {
                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .scaleEffect(scaleEffect)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.scaleEffect = 1.0
                        }
                    }

                Text("EcoMeter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
                }
            }
        }
    }
}
#Preview {
    SplashView()
}
