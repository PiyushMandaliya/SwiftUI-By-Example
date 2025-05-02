//
//  TabView.swift
//  Containers
//
//  Created by Piyush Mandaliya on 2025-04-25.
//

import SwiftUI

struct TabViewExample: View {
    enum Section {
        case cats
        case dogs
    }
    
    enum SectionTag: Int {
        case cats = 1
        case dogs = 2
    }
    
    @State private var selectedTab = Section.cats
    @State private var selectedTabTag: Int = SectionTag.cats.rawValue
    var body: some View {
        
        if #available(iOS 18.0, *) {
            TabView(selection: $selectedTab) {
                Tab("Cats", systemImage: "cat", value: .cats) {
                    Button("Go to Dogs") {
                        selectedTab = .dogs
                    }
                }
                .badge(5)
                
                Tab("Dogs", systemImage: "dog", value: .dogs) {
                    Button("Go to Cats") {
                        selectedTab = .cats
                    }
                }
            }
        } else {
            TabView(selection: $selectedTabTag) {
                Button("Go to Dogs") {
                    selectedTabTag = SectionTag.dogs.rawValue
                }
                .padding()
                .tabItem {
                    Label("Cats", systemImage: "cat")
                }
                .tag(SectionTag.cats.rawValue)
                
                Button("Go to Cats") {
                    selectedTabTag = SectionTag.cats.rawValue
                }
                .padding()
                .tabItem {
                    Label("Dogs", systemImage: "dog")
                }
                .badge(5)
                .tag(SectionTag.dogs.rawValue)
            }
        }
    }
}

#Preview {
    TabViewExample()
}
