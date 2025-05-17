//
//  SpringAnimation.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct SpringAnimation: View {
    @State private var angle: Double = 0
    @State private var scale = 1.0

    var body: some View {
        Button ("Press Here") {
            angle += 45
        }
        .padding()
        .rotationEffect(.degrees(angle))
        .animation(.spring(), value: angle)
        
        
        Button ("Press Here (interpolatingSpring)") {
            angle += 45
        }
        .padding()
        .rotationEffect(.degrees(angle))
        .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 10), value: angle)
        
        Button("Press here") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.spring(duration: 1, bounce: 2), value: scale)
    }
}

#Preview {
    SpringAnimation()
}
