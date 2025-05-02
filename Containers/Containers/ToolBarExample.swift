//
//  ToolBarExample.swift
//  Containers
//
//  Created by Piyush Mandaliya on 2025-04-25.
//

import SwiftUI

struct ToolBarExample: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
            .navigationTitle("SwiftUI")
            .toolbar {
                //                ToolbarItem(placement: .bottomBar) {
                //                    Button("Press Me") {
                //                        print("Pressed")
                //                    }
                //                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("First") {
                        print("Pressed")
                    }
                    
                    Button("Second") {
                        print("Pressed")
                    }
                }
            }
    }
}

#Preview {
    ToolBarExample()
}
