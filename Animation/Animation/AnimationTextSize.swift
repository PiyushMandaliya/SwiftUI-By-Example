//
//  AnimationTextSize.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct AnimationTextSize: View {
    @State private var fontSize = 32.0
    
    var body: some View {
        Text("Hello, World!")
            .font(.custom("Georgia", size: fontSize))
            .onTapGesture {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    fontSize = 72
                }
            }
    }
}

#Preview {
    AnimationTextSize()
}
