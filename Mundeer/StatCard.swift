//
//  StatCard.swift
//  Mundeer
//
//  Created by saroj kumar sah on 15/05/25.
//

import Foundation
import SwiftUI
struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(color)
                .frame(width: 10, height: 15)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(value)
                    .font(.title2)
                    .bold()
                    .foregroundColor(color)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

