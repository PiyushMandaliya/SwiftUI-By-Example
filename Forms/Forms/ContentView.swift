//
//  ContentView.swift
//  Forms
//
//  Created by Piyush Mandaliya on 2025-04-24.
//

import SwiftUI

enum ContentType: CaseIterable, Hashable {
    case formDesign, formSections, pickersInForms, disableElements, showHideRows, labelAlignment
    
    var title: String {
        switch self {
        case .formDesign:
            "Form Design"
        case .formSections:
            "Form Sections"
        case .pickersInForms:
            "Pickers in Forms"
        case .disableElements:
            "Disable Elements"
        case .showHideRows:
            "Show/Hide Rows"
        case .labelAlignment:
            "Label Alignment"
        
        }
    }
    
    var destination: some View {
        return AnyView(FormView(contentType: self))
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(ContentType.allCases, id: \.self) { type in
                NavigationLink(destination: type.destination) {
                    Text(type.title)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("List Example")
        }
    }
}

#Preview {
    ContentView()
}
