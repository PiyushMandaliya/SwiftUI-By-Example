//
//  GestureRecognizer.swift
//  Gesture
//
//  Created by Piyush Mandaliya on 2025-04-20.
//

import SwiftUI

enum GestureRecognizerType: String, CaseIterable {
    
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

struct GestureRecognizer: View {
    
    var body: some View {
        List(GestureRecognizerType.allCases, id: \.self) { gesture in
            NavigationLink(destination: GestureRecognizerView(gestureType: gesture)) {
                Text(gesture.title)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Gesture Recognizer")
    }
}
