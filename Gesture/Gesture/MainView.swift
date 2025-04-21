//
//  ContentView.swift
//  Gesture
//
//  Created by Piyush Mandaliya on 2025-04-20.
//

import SwiftUI

enum GestureType: CaseIterable, Hashable {
    case gestureRecognizer
    
    var title: String {
        switch self {
        case .gestureRecognizer:
            "Gesture Recognizer"
        }
    }
    
    var destination: some View {
        switch self {
        case .gestureRecognizer:
            GestureRecognizer()
        }
    }
}


struct MainView: View {
    
    var body: some View {
        NavigationStack {
            List(GestureType.allCases, id: \.self) { type in
                NavigationLink(destination: type.destination) {
                    Text(type.title)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Gesture Example")
        }
    }
}
