//
//  ExplicitAnimation.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct ExplicitAnimation: View {
    @State private var opacity = 1.0
    @State var rotation: Double = 0
    

    var body: some View {
        Button ("Press here") {
            withAnimation(.linear(duration: 1)) {
                opacity -= 0.2
            }
        }
        .padding()
        .opacity(opacity)
        
        Spacer()
            .frame(height: 100)
        
        Rectangle()
            .fill(.red)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(rotation))
            .animation(.easeInOut(duration: 3).delay(3), value: rotation)
            .onTapGesture {
                rotation += 360
            }
    }
}

#Preview {
    ExplicitAnimation()
}
