//
//  CombineTransitions.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
}

struct CombineTransitions: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            
            if showDetails {
                Text("Details go here.")
                    .transition(.moveAndScale)
            }
        }
    }
}

#Preview {
    CombineTransitions()
}
