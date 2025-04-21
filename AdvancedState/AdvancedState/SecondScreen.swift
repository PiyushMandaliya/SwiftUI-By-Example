//
//  SecondScreen.swift
//  AdvancedState
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI

// How to use @EnvironmentObject to share data between views

class GameSettings: ObservableObject {
    @Published var score: Int = 0
}

// A view that expects to find a GameSettings object
// in the environment, and shows its score.

struct ScoreView: View {
    @EnvironmentObject var settings: GameSettings
    
    var body: some View {
        Text("Score: \(settings.score)")
    }
}

// A view that creates the GameSettings object,
// and places it into the environment for the
// navigation stack.
struct SecondScreen: View {
    @StateObject var settings = GameSettings()
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Increase Score") {
                    settings.score += 1
                }
                
                NavigationLink {
                    ScoreView()
                } label: {
                    Text("Show Detail View")
                }
            }
            .frame(height: 200)
        }
        .environmentObject(settings)
    }
}

#Preview {
    SecondScreen()
}
