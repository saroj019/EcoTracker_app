//
//   EditProfileView.swift
//  Mundeer
//
//  Created by saroj kumar sah on 14/05/25.
//

import Foundation
import SwiftUI

struct EditProfileView: View {
    @Binding var name: String
    @Binding var location: String
    @Binding var email: String

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("Name", text: $name)
                    TextField("Location", text: $location)
                    TextField("Email", text: $email)
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
        }
    }
}
