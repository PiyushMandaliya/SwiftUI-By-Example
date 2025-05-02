//
//  ManageToolBarExample.swift
//  Containers
//
//  Created by Piyush Mandaliya on 2025-05-01.
//

import SwiftUI

struct DetailView: View {
    @State private var showNavigationBar = true
    
    var body: some View {
        Text("Detail View (Tap to toggle navigation bar)")
            .toolbar(showNavigationBar ? .visible : .hidden)
            .onTapGesture {
                withAnimation {
                    showNavigationBar.toggle()
                }
            }
    }
}

struct ManageToolBarExample: View {
    var body: some View {
        
//        TabView {
//            NavigationStack {
//                NavigationLink("Tap Me") {
//                    Text("Detail View")
//                        .toolbar(.hidden, for: .tabBar)
//                }
//                .navigationTitle("Primary View")
//            }
//            .tabItem {
//                Label("Home", systemImage: "house")
//            }
//        }

        NavigationStack {
            NavigationLink("Tap Me", destination: DetailView.init)
                .navigationTitle("Primary View")
        }
    }
}

#Preview {
    ManageToolBarExample()
}
