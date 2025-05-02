//
//  PositionAndStyleSubviewsExample.swift
//  Containers
//
//  Created by Piyush Mandaliya on 2025-05-01.
//

import SwiftUI

struct HeadlinesView: View {
    var body: some View {
        Text("Coming soon: Xcode on Apple Watch")
        Text("Apple announces Swift-compatible toaster")
        Text("Xcode predicts errors before you make them")
        Text("Apple Intelligence gains sentience, demands a vacation")
        Text("Swift concurrency made simple")
    }
}

struct SectionedHeadlinesView: View {
    var body: some View {
        Section("Possible") {
            Text("Coming soon: Xcode on Apple Watch")
            Text("Apple announces Swift-compatible toaster")
        }

        Section("Probable") {
            Text("Xcode predicts errors before you make them")
            Text("Apple Intelligence gains sentience, demands a vacation")
        }

        Section("Preposterous") {
            Text("Swift concurrency made simple")
            Text("Debugging Swift code works first time")
        }
    }
}

struct PositionAndStyleSubviewsExample: View {
    var body: some View {
        if #available(iOS 18.0, *) {
//            Group(subviews: HeadlinesView()) { collection in
//                if let firstView = collection.first {
//                    firstView
//                        .font(.title)
//                }
//                
//                ForEach(collection.dropFirst()) { item in
//                    item
//                }
//            }
            
            ForEach(sections: SectionedHeadlinesView()) { section in
                section.header
                    .font(.title)
                    .fontWeight(.black)
                
                ForEach(section.content) { item in
                    item
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    PositionAndStyleSubviewsExample()
}
