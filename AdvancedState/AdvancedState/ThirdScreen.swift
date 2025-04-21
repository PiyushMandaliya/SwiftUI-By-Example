//
//  ThirdScreen.swift
//  AdvancedState
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI

// Custom Bindings
struct ThirdScreen: View {
    @State private var firstToggle = false
    @State private var secondToggle = false
    
    var body: some View {
        let firstBinding = Binding(
            get: { self.firstToggle },
            set: {
                self.firstToggle = $0
                
                if $0 == true {
                    self.secondToggle = false
                }
            }
        )
        
        let secondBinding = Binding(
            get: { self.secondToggle },
            set: {
                self.secondToggle = $0
                
                if $0 == true {
                    self.firstToggle = false
                }
            }
        )
        
        return VStack {
            Toggle(isOn: firstBinding) {
                Text("First toggle")
            }
            
            Toggle(isOn: secondBinding) {
                Text("Second toggle")
            }
        }
    }
}

#Preview {
    ThirdScreen()
}
