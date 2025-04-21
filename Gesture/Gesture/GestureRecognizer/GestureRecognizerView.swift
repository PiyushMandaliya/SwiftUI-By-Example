//
//  GestureView.swift
//  Gesture
//
//  Created by Piyush Mandaliya on 2025-04-20.
//

import SwiftUI

struct GestureRecognizerView: View {
    
    let gestureType: GestureRecognizerType
    
    
    @State private var scale = 1.0
    @State private var dragCompleted = false
    @State private var dragOffset = CGSize.zero
    
    var body: some View {
        VStack {
            switch gestureType {
            case .TapGesture:
                tapGesture()
            case .LongPressGesture:
                longPressGesture()
            case .DragGesture:
                dragGesture()
            }
            
            if dragCompleted {
                Text("Drag completed!")
            }
        }
        .navigationTitle(gestureType.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    private func tapGesture() -> some View {
        catImage()
            .gesture(
                TapGesture()
                    .onEnded { _ in
                        scale -= 0.1
                    }
            )
    }
    
    private func longPressGesture() -> some View {
        catImage()
            .gesture(
                LongPressGesture(minimumDuration: 1)
                    .onEnded { _ in
                        scale /= 2
                    }
                
            )
    }
    
    private func dragGesture() -> some View {
        catImage()
            .offset(dragOffset)
            .gesture(
                DragGesture(minimumDistance: 50)
                    .onChanged { gesture in
                        dragOffset = gesture.translation
                        
                    }
                    .onEnded { _ in
                        dragOffset = .zero
                        dragCompleted = true
                    }
            )
    }
    
    private func catImage() -> some View {
        return Image(.cat)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(scale)
    }
    
}
