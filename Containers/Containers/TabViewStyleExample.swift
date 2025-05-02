//
//  TabViewStyleExample.swift
//  Containers
//
//  Created by Piyush Mandaliya on 2025-04-25.
//

import SwiftUI

struct TabViewStyleExample: View {
    var body: some View {
        TabView {
            Text("First")
            Text("Second")
            Text("Third")
            Text("Fourth")
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview {
    TabViewStyleExample()
}
