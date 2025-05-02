//
//  CustomToolBarButtons.swift
//  Containers
//
//  Created by Piyush Mandaliya on 2025-04-25.
//

import SwiftUI

struct CustomToolBarButtons: View {
    var body: some View {
        Text("Custom ToolBar Buttons")
            .navigationTitle("Welcome")
            .toolbar(id: "options") {
                ToolbarItem(id: "settings", placement: .primaryAction) {
                    Button("Settings") { }
                }
                
                ToolbarItem(id: "font", placement: .secondaryAction) {
                    ControlGroup {
                        Button {
                            // decrease font
                        } label: {
                            Label("Decrease font size", systemImage: "textformat.size.smaller")
                        }
                        
                        Button {
                            // increase font
                        } label: {
                            Label("Increase font size", systemImage: "textformat.size.larger")
                        }
                    } label: {
                        Label("Font Size", systemImage: "textformat.size")
                    }
                }
                
                ToolbarItem(id: "help", placement: .secondaryAction) {
                    Button("Help") { }
                }
                
                ToolbarItem(id: "email", placement: .secondaryAction) {
                    Button("Email Me") { }
                }
                
                ToolbarItem(id: "credits", placement: .secondaryAction, showsByDefault: false) {
                    Button("Credits") { }
                }
            }
            .toolbarRole(.editor)
    }
}

#Preview {
    CustomToolBarButtons()
}
