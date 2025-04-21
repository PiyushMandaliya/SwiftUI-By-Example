//
//  ContentView.swift
//  Gesture
//
//  Created by Piyush Mandaliya on 2025-04-20.
//

import SwiftUI

enum GestureType: String, CaseIterable {
    
    case TapGesture
    case LongPressGesture
    case DragGesture
    
    var title: String {
        switch self {
        case .TapGesture:
            "Tap Gesture"
        case .LongPressGesture:
            "Long Press Gesture"
        case .DragGesture:
            "Drag Gesture"
        }
    }
    
}

struct ContentView: View {
    
    @State private var scale = 1.0
    
    private var gestureTypeList = ["Tap Gesture"]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(GestureType.allCases, id: \.self) { gesture in
                    NavigationLink(value: gesture) {
                        Text(gesture.title)
                    }
                }
                .navigationDestination(for: GestureType.self) { gesture in
                    GestureView(gestureType: gesture)
                }
            }
            .navigationTitle("Gesture Example")
        }
    }
}

#Preview {
    ContentView()
}
