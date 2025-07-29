//
//   WellnessCard.swift
//  Mundeer
//
//  Created by saroj kumar sah on 17/05/25.
//

import Foundation
import SwiftUI
struct WellnessCard<Content: View>: View {
    let title: String
    let isExpanded: Bool
    let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)

            if isExpanded {
                content()
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.2), radius: 5)
            }
        }
        .animation(.easeInOut, value: isExpanded)
    }
}
