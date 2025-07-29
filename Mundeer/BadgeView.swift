//
//  BadgeView.swift
//  Mundeer
//
//  Created by saroj kumar sah on 15/05/25.
//

import Foundation
import SwiftUI

struct BadgeView: View {
    let title: String
    let image: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.green)

            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .frame(width: 80)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

