//
//  AddRemoveViewWithTransition.swift
//  Animation
//
//  Created by Piyush Mandaliya on 2025-05-16.
//

import SwiftUI

struct AddRemoveViewWithTransition: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            
            if showDetails {
                // Moves in from the bottom
                Text("Details go here.")
                    .transition(.move(edge: .bottom))
                
                // Moves in from leading out, out to trailing edge.
                Text("Details go here.")
                    .transition(.slide)
                
                // Starts small and grows to full size.
                Text("Details go here.")
                    .transition(.scale)
            }
        }
    }
}

#Preview {
    AddRemoveViewWithTransition()
}
