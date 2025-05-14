//
//  ContentView.swift
//  Drawing
//
//  Created by Piyush Mandaliya on 2025-05-13.
//

import SwiftUI

struct ContentView: View {
    
    enum ContentList: CaseIterable {
        case drawCustomPath, drawPolygonsAndStars, drawCheckerBoard, customAnimatedDrawing, metalShaders, customTextEffectsAndAnimation
        
        var title: String {
            switch self {
            case .drawCustomPath:
                return "Draw Custom Path"
            case .drawPolygonsAndStars:
                return "Draw Polygons & Stars"
            case .drawCheckerBoard:
                return "Draw CheckerBoard"
            case .customAnimatedDrawing:
                return "Custom Animated Drawing"
            case .metalShaders:
                return "Metal Shaders"
            case .customTextEffectsAndAnimation:
                return "Custom Text Effects & Animation"
            }
        }
        
        var destination: some View {
            switch self {
            case .drawCustomPath:
                return AnyView(DrawCustomPath())
            case .drawPolygonsAndStars:
                return AnyView(DrawPolygonsAndStarts())
            case .drawCheckerBoard:
                return AnyView(DrawCheckerBoard())
            case .customAnimatedDrawing:
                return AnyView(CustomAnimatedDrawing())
            case .metalShaders:
                return AnyView(MetalShaders())
            case .customTextEffectsAndAnimation:
                return AnyView(CustomTextEffectsAndAnimation())
            }
        }
    }
    
    
    var body: some View {
        NavigationStack {
            List(ContentList.allCases, id: \.self) {content in
                NavigationLink(destination: content.destination) {
                    Text(content.title)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Drawing Example")
        }
    }
}

#Preview {
    ContentView()
}
