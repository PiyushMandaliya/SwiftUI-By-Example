//
//  FifthScreen.swift
//  AdvancedState
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI


struct AdaptiveView<T: View, U: View>: View {
    @Environment(\.colorScheme) var colorScheme
    let light: T
    let dark: U

    init(light: T, dark: U) {
        self.light = light
        self.dark = dark
    }

    init(light: () -> T, dark: () -> U) {
        self.light = light()
        self.dark = dark()
    }

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}

struct FifthScreen: View {
    var body: some View {
        VStack {
            AdaptiveView {
                VStack {
                    Text("Light mode")
                    Image(systemName: "sun.max")
                }
            } dark: {
                HStack {
                    Text("Dark mode")
                    Image(systemName: "moon")
                }
            }
            .font(.largeTitle)
        }
    }
}

extension EnvironmentValues {
    @Entry var iconColor: Color = .red
}

#Preview {
    FifthScreen()
}

