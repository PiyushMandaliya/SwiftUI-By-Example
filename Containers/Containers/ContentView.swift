//
//  ContentView.swift
//  Containers
//
//  Created by Piyush Mandaliya on 2025-04-25.
//

import SwiftUI

struct ContentView: View {
    enum ContentType: CaseIterable, Hashable {
        case tabView, tabViewStyle, toolBar, customToolBarButtons, manageToolBar, customizeBackgroundColorExample, positionAndStyleSubviewsExample
        
        var title: String {
            switch self {
            case .tabView:
                "TabView Example"
            case .tabViewStyle:
                "TabView Style"
            case .toolBar:
                "ToolBar"
            case .customToolBarButtons:
                "Custom ToolBar Buttons"
            case .manageToolBar:
                "Hide ToolBar"
            case .customizeBackgroundColorExample:
                "Customize Background Color Example"
            case .positionAndStyleSubviewsExample:
                "Position and Style Subviews Example"
            }
        }
        
        var destination: some View {
            switch self {
            case .tabView:
                return AnyView(TabViewExample())
            case .tabViewStyle:
                return AnyView(TabViewStyleExample())
            case .toolBar:
                return AnyView(ToolBarExample())
            case .customToolBarButtons:
                return AnyView(CustomToolBarButtons())
            case .manageToolBar:
                return AnyView(ManageToolBarExample())
            case .customizeBackgroundColorExample:
                return AnyView(CustomizeBackgroundColorExample())
            case .positionAndStyleSubviewsExample:
                return AnyView(PositionAndStyleSubviewsExample())
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(ContentType.allCases, id: \.self) { type in
                NavigationLink(destination: type.destination) {
                    Text(type.title)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("TabView Example")
        }
    }
}

#Preview {
    ContentView()
}
