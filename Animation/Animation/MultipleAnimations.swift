//
//  MultipleAnimations.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct MultipleAnimations: View {
    @State private var isEnabled = false
    
    var body: some View {
        Button("Press Me") {
            isEnabled.toggle()
        }
        .foregroundStyle(.white)
        .frame(width: 200, height: 200)
        .animation(.easeInOut(duration: 1)) { content in
            content.background(isEnabled ? .green : .red)
        }
        .animation(.easeInOut(duration: 1)) { content in
            content
                .clipShape(.rect(cornerRadius: isEnabled ? 100 : 0))
        }
    }
}

#Preview {
    MultipleAnimations()
}
