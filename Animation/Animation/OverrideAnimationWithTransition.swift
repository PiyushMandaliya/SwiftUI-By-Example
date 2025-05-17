//
//  OverrideAnimationWithTransition.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct OverrideAnimationWithTransition: View {
    @State private var isZoomed = false
    var body: some View {
        VStack {
            Button("Toggle Zoom") {
                var transaction = Transaction(animation: .linear)
                transaction.disablesAnimations = true
                
                withTransaction(transaction) {
                    isZoomed.toggle()
                }
            }
            
            Spacer()
                .frame(height: 100)
            
            Text("Zoom Text 1")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)
                .animation(.easeInOut(duration: 2), value: isZoomed)

            Spacer()
                .frame(height: 100)
            
            Text("Zoom Text 2")
                .font(.title)
                .scaleEffect(isZoomed ? 3 : 1)
                .transaction { t in
                    t.animation = Animation.linear(duration: 5)
                }

        }
    }
}

#Preview {
    OverrideAnimationWithTransition()
}
