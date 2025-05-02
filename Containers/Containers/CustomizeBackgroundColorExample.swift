//
//  CustomizeBackgroundColorExample.swift
//  Containers
//
//  Created by Piyush Mandaliya on 2025-05-01.
//

import SwiftUI

struct CustomizeBackgroundColorExample: View {
    var body: some View {
        
//        NavigationStack {
//            List(0..<100) {
//                Text("Row \($0)")
//            }
//            .navigationTitle("100 Rows")
//            .toolbarBackground(.teal)
//        }
        
        TabView {
            NavigationStack {
                List(0..<100) {
                    Text("Row \($0)")
                }
                .navigationTitle("100 Rows")
                .toolbarBackground(.orange, for: .tabBar, .navigationBar)
            }
            .tabItem {
                Label("Rows", systemImage: "list.bullet")
            }
        }
    }
}

#Preview {
    CustomizeBackgroundColorExample()
}
