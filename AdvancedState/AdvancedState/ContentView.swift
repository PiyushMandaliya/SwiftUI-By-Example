//
//  ContentView.swift
//  AdvancedState
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI


class Player: ObservableObject {
    @Published var name = "Piyush"
    @Published var age = 25
}

//How to use @StateObject to create and monitor external objects
struct ContentView: View {
    @StateObject var player = Player()
    
    var body: some View {
        NavigationStack {
            NavigationLink {
                PlayerDetailView(player: player)
            } label: {
                Text("Show Detail View")
            }
            
            
            
            NavigationLink {
                 FirstScreen()
            } label: {
                Text("First Screen")
            }
            
            NavigationLink {
                 
            } label: {
                Text("Second Screen")
            }
            
            NavigationLink {
                 
            } label: {
                Text("Third Screen")
            }
            
            
        }
    }
}

struct PlayerDetailView: View {
    @ObservedObject var player: Player
    
    
    var body: some View {
        Text("Hello, \(player.name)!")
    }
}

#Preview {
    ContentView()
}
