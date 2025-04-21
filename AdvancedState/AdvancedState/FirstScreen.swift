//
//  FirstScreen.swift
//  AdvancedState
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI

class UserProgress: ObservableObject {
    @Published var score: Int = 0
}

//How to use @ObservedObject to manage state from external objects
struct FirstScreen: View {
    @StateObject var progress = UserProgress()
    
    var body: some View {
        Text("Your score is \(progress.score)")
        InnerView(progress: progress)
    }
}

struct InnerView: View {
    @ObservedObject var progress: UserProgress
    
    var body: some View {
        Button("Increment Score") {
            progress.score += 1
        }
    }
}

#Preview {
    FirstScreen()
}
