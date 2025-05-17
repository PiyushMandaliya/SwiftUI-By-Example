//
//  BasicAnimation.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct BasicAnimation: View {
    @State private var scale = 1.0
    
    @State private var angle = 0.0
    @State private var borderThickness = 1.0

    
    var body: some View {
        Button ("Press here") {
            scale += 1.0
        }
        .scaleEffect(scale)
        .animation(.linear(duration: 1), value: scale)
        
        Button("Press here (EaseIn)") {
            scale += 1
        }
        .scaleEffect(scale)
        .animation(.easeIn, value: scale)
        
        Button("Press here RotationEffect") {
            angle += 45
            borderThickness += 1
        }
        .padding()
        .border(.red, width: borderThickness)
        .rotationEffect(.degrees(angle))
        .animation(.easeIn, value: angle)
    }
}

#Preview {
    BasicAnimation()
}
