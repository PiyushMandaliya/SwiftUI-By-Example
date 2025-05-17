//
//  AnimationOnViewAppear.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

// If intend to add initial animations frequently
//Create an immediate, looping animation
extension View {
    func animateForever(using animation: Animation = .easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)

        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}

struct AnimationOnViewAppear: View {
    @State var scale = 1.0
    
    var body: some View {
        Circle()
            .frame(width: 200,height: 200)
            .scaleEffect(scale)
            .animateForever(autoreverses: true) {
                scale = 0.5
            }
//            .onAppear {
//                let baseAnimation = Animation.easeInOut(duration: 1)
//                let repeated = baseAnimation.repeatForever(autoreverses: true)
//                
//                withAnimation(repeated) {
//                    scale = 0.5
//                }
//            }
    }
}

#Preview {
    AnimationOnViewAppear()
}
