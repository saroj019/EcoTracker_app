import SwiftUI

struct ProfileView: View {
    @State private var name: String = "Honey Singh"
    @State private var location: String = "Delhi, India"
    @State private var email: String = "honey@Raftaar.com"
    @State private var ecoLevel: Int = 5
    @State private var points: Int = 120
    @State private var streak: Int = 4
    @State private var showEdit = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Profile Image Placeholder
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.green)
                        .padding(.top)
                    
                    // Profile Info
                    Text(name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(email)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Divider()
            
                                        VStack(spacing: 12) {
                                            StatCard(title: "Eco Level", value: "Lv \(ecoLevel)", icon: "leaf.fill", color: .green)
                                            StatCard(title: "Eco Points", value: "\(points)", icon: "star.fill", color: .yellow)
                                            StatCard(title: "Streak", value: "\(streak) days", icon: "flame.fill", color: .orange)
                                        }
                    
                    Divider()
                    
                    // Badges Section
                    VStack(alignment: .leading, spacing: 12) {
                        Text("🏅 Badges Earned")
                            .font(.headline)
                        
                                                ScrollView(.horizontal, showsIndicators: false) {
                                                    HStack(spacing: 16) {
                                                        BadgeView(title: "Tree Planter", image: "tree.fill")
                                                        BadgeView(title: "Recycle Champ", image: "arrow.2.circlepath")
                                                        BadgeView(title: "Green Commuter", image: "bicycle")
                                                        BadgeView(title: "Energy Saver", image: "bolt.fill")
                                                    }
                                                }
                                            }
                            .padding(.horizontal)
                        
                        Divider()
                        
                        // Edit Profile
                        Button(action: {
                            showEdit.toggle()
                        }) {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.bottom)
                    .navigationTitle("👤 Profile")
                    .sheet(isPresented: $showEdit) {
                        EditProfileView(name: $name, location: $location, email: $email)
                    }
                }
            }
        }
    }

#Preview {
    ProfileView()
}
