import SwiftUI
import PhotosUI

struct UploadView: View {
    @State private var selectedAction = ""
    @State private var description = ""
    @State private var isSubmitted = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: UIImage? = nil
    @State private var showingPicker = false

    let actions = ["Planted a Tree", "Used Public Transport", "Recycled Waste", "Saved Electricity", "Used Reusable Bag"]

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Log Eco Action")
                    .font(.title2)
                    .bold()
                    .padding(.top)

                // Action Picker
                Picker("Select Action", selection: $selectedAction) {
                    ForEach(actions, id: \.self) { action in
                        Text(action)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

                // Description
                TextField("Add a short description...", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Media Picker
                PhotosPicker(selection: $selectedItem, matching: .any(of: [.images, .videos]), photoLibrary: .shared()) {
                    Label("Upload Photo/Video", systemImage: "photo.on.rectangle")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
//                .onChange(of: selectedItem) { newItem in
//                    Task {
//                        if let data = try? await newItem?.loadTransferable(type: Data.self),
//                           let uiImage = UIImage(data: data) {
//                            selectedImage = uiImage
//                        }
//                    }
//                }
                .padding(.horizontal)

                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }

                // Submit
                Button(action: {
                    isSubmitted = true
                    selectedAction = ""
                    description = ""
                    selectedImage = nil
                }) {
                    Text("Submit")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Upload")
            .alert(isPresented: $isSubmitted) {
                Alert(title: Text("Success"), message: Text("Eco action logged!"), dismissButton: .default(Text("OK")))
            }
        }
    }
}
