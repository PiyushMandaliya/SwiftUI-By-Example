//
//  ReturnToRootView.swift
//  Navigation
//
//  Created by Piyush Mandaliya on 2025-05-04.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go To Random Number", value: Int.random(in: 1...5000))
            .navigationTitle("Number \(number)")
            .toolbar {
                Button("Home") {
                    self.path = NavigationPath()
                }
            }
    }
}

struct ReturnToRootView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ReturnToRootView()
}
