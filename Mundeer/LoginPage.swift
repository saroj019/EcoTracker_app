import SwiftUI

struct LoginPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var showError = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @State private var navigateToMain = false

    var body: some View {
        if navigateToMain {
            MainView() // ✅ Redirects to MainView when logged in
        } else {
            VStack(spacing: 30) {
                Spacer()

                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.green)

                Text("EcoMeter Login")
                    .font(.largeTitle)
                    .fontWeight(.semibold)

                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)

                HStack {
                    if showPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }

                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)

                Button(action: {
                    if email == "saroj@gmail.com" && password == "123" {
                        isLoggedIn = true
                        navigateToMain = true // ✅ Go to MainView
                    } else {
                        showError = true    
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                if showError {
                    Text("❌ Invalid credentials. Use saroj@gmail.com / 123")
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.horizontal)
                }

                Spacer()

                Text("🌱 TOPA SENA  ZINDZABAAD🫥")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    LoginPage()
}
