//
//  Challenge.swift
//  Mundeer
//
//  Created by saroj kumar sah on 14/05/25.
//

import Foundation
import SwiftUI

// Model for each challenge
struct Challenge: Identifiable {
    let id = UUID()  // Unique identifier for each challenge
    let title: String  // Title of the challenge
    let description: String  // Brief description of the challenge
    let progress: Double  // Progress percentage (0 to 1)
}
