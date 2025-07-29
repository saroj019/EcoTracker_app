//
//  BreathingExerciseView.swift
//  Mundeer
//
//  Created by saroj kumar sah on 17/05/25.
//

import Foundation
import SwiftUI

struct BreathingExerciseView: View {
    @State private var breatheIn = true

    var body: some View {
        VStack {
            Text(breatheIn ? "Breathe In" : "Breathe out")
                .font(.largeTitle)
                .padding()

            Circle()
                .frame(width: 100, height: 100)
                .scaleEffect(breatheIn ? 1.2:0.8)
                .animation(Animation.easeInOut(duration: 5).repeatForever(autoreverses: true), value: breatheIn)
                .onAppear {
                    breatheIn.toggle()
                }

            Spacer()
        }
        .padding()
    }
}
#Preview {
    BreathingExerciseView( )
}
