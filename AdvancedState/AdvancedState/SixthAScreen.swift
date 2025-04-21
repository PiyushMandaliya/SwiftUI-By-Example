//
//  SixthAScreen.swift
//  AdvancedState
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI

struct BubblesView: View {
    @Environment(\.iconColor) var iconColor

    var body: some View {
        Image(systemName: "bubbles.and.sparkles.fill")
            .foregroundStyle(iconColor)
            .font(.largeTitle)
    }
}

struct SixthAScreen: View {
    
    var body: some View {
        HStack {
            BubblesView()
                .environment(\.iconColor, .blue)
            
            BubblesView()
                .environment(\.iconColor, .red)
        }
    }
}

#Preview {
    SixthAScreen()
}
