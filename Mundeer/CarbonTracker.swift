//
//  CarbonTracker.swift
//  Mundeer
//
//  Created by saroj kumar sah on 14/05/25.
//

import Foundation
import Foundation

// Model for tracking CO₂ savings from eco actions
struct CarbonTracker {
    var totalCO2Saved: Double // Total CO₂ saved in kg
    var actions: [EcoAction] // List of eco actions performed

    init() {
        self.totalCO2Saved = 0
        self.actions = []
    }

    // Add eco action and update CO₂ saved
    mutating func logAction(action: EcoAction) {
        actions.append(action)
        totalCO2Saved += action.co2Saved
    }

    // Reset the tracker (e.g., for daily tracking)
    mutating func reset() {
        totalCO2Saved = 0
        actions = []
    }
}

// Model to represent each eco action and its CO₂ savings
struct EcoAction {
    var title: String
    var co2Saved: Double // CO₂ saved from this action (in kg)
}
