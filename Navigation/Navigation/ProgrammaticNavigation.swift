//
//  ContentView.swift
//  Navigation
//
//  Created by Piyush Mandaliya on 2025-05-04.
//

import SwiftUI

struct ProgrammaticNavigation: View {
    @State private var presentedNumbers = [Int]()

    var body: some View {
        NavigationStack(path: $presentedNumbers) {
            List(1..<50) { i in
                NavigationLink(value: i) {
                    Label("Row \(i)", systemImage: "\(i).circle")
                }
                
            }
            .navigationDestination(for: Int.self) { i in
                VStack {
                    Text("Detail \(i)")

                    Button("Go to Next") {
                        presentedNumbers.append(i + 1)
                    }
                    
                    Button("Go to Random Number") {
                        presentedNumbers.append(Int.random(in: 1...500))
                    }
                }
                .navigationTitle("Navigation \(i)")
            }
            .navigationTitle("Navigation")
        }
    }
}

#Preview {
    ProgrammaticNavigation()
}
