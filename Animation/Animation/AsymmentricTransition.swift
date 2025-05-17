//
//  AsymmentricTransition.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct AsymmentricTransition: View {
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
                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
            }
        }
    }
}

#Preview {
    AsymmentricTransition()
}
