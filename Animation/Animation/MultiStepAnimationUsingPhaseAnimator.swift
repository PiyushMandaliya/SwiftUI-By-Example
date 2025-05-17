//
//  MultiStepAnimationUsingPhaseAnimator.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

enum AnimationPhase: Double, CaseIterable {
    case fadingIn = 0
    case middle = 1
    case zoomingOut = 3
}

enum AnimationPhase1: CaseIterable {
    case start, middle, end
}

enum AnimationPhase2: CaseIterable {
    case fadingIn, middle, zoomingOut

    var scale: Double {
        switch self {
        case .fadingIn: 0
        case .middle: 1
        case .zoomingOut: 3
        }
    }

    var opacity: Double {
        switch self {
        case .fadingIn: 0
        case .middle: 1
        case .zoomingOut: 0
        }
    }
}

struct MultiStepAnimationUsingPhaseAnimator: View {
    @State private var animationStep = 0

    var body: some View {
        
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .phaseAnimator([1,2,3]) { view, phase in
                    view
                        .scaleEffect(phase)
                        .opacity(phase == 1 ? 1 : 0)
                }
            
            Spacer()
                .frame(height: 100)
            
            VStack(spacing: 50) {
                PhaseAnimator([0, 1, 3]) { value in
                    Text("Hello, world!")
                        .font(.largeTitle)
                        .scaleEffect(value)
                        .opacity(value == 1 ? 1 : 0)
                    
                    Text("Goodbye, world!")
                        .font(.largeTitle)
                        .scaleEffect(3 - value)
                        .opacity(value == 1 ? 1 : 0)
                }
            }
            
            
            Spacer()
                .frame(height: 100)
            
            
            VStack {
                Text("Hello, world!")
                    .font(.largeTitle)
                    .phaseAnimator(AnimationPhase.allCases) { view, phase in
                        view
                            .scaleEffect(phase.rawValue)
                            .opacity(phase.rawValue == 1 ? 1 : 0)
                    }
            }
            
            Spacer()
                .frame(height: 100)
            
            
            Button("Tap Me!") {
                animationStep += 1
            }
            .font(.largeTitle)
            .phaseAnimator(AnimationPhase1.allCases, trigger: animationStep) { content, phase in
                content
                    .blur(radius: phase == .start ? 0 : 10)
                    .scaleEffect(phase == .middle ? 3 : 1)
            } animation: { phase in
                switch phase {
                case .start, .end: .bouncy
                case .middle: .easeInOut(duration: 2)
                }
            }
            
            Spacer()
                .frame(height: 100)
            
            Text("Hello, world!")
                .font(.largeTitle)
                .phaseAnimator(AnimationPhase2.allCases) { content, phase in
                    content
                        .scaleEffect(phase.scale)
                        .opacity(phase.opacity)
                }
            
        }
    }
}

#Preview {
    MultiStepAnimationUsingPhaseAnimator()
}
