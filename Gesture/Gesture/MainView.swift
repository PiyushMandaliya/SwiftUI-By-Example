//
//  ContentView.swift
//  Gesture
//
//  Created by Piyush Mandaliya on 2025-04-20.
//

import SwiftUI

enum GestureType: CaseIterable, Hashable {
    case gestureRecognizer, priorityGesture, handlePinchZoom, shakeGesture, hoveringOverView, simultaneousGesture, gestureChains, controlTapableArea, disableTaps
    
    var title: String {
        switch self {
        case .gestureRecognizer:
            "Gesture Recognizer"
        case .priorityGesture:
            "Priority Gesture"
        case .handlePinchZoom:
            "Handle Pinch Zoom"
        case .shakeGesture:
            "Shake Gesture"
        case .hoveringOverView:
            "Hovering Over View"
        case .simultaneousGesture:
            "Simultaneous Gesture"
        case .gestureChains:
            "Gesture Chains"
        case .controlTapableArea:
            "Control Tapable Area"
        case .disableTaps:
            "Disable Taps"
        }
    }
    
    var destination: some View {
        switch self {
        case .gestureRecognizer:
            return AnyView(GestureRecognizer())
        case .priorityGesture, .handlePinchZoom, .shakeGesture, .hoveringOverView, .simultaneousGesture, .gestureChains, .controlTapableArea, .disableTaps:
            return AnyView(OtherGesture(self))
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
