//
//  ContentView.swift
//  Lists
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI

enum ListType: CaseIterable, Hashable {
    case staticList, dynamicList, deleteRows, moveRows, listSection, listEditing, listStyle, expandingList, scrollToRow, searchBarToFilterData, searchTokenToSearchField, listFromBinding, ListRowSeparatorInsets
    
    var title: String {
        switch self {
        case .staticList:
            "Static List"
        case .dynamicList:
            "Dynamic List"
        case .deleteRows:
            "Delete Rows"
        case .moveRows:
            "Move Rows"
        case .listSection:
            "List Section"
        case .listEditing:
            "List Editing"
        case .listStyle:
            "List Styles"
        case .expandingList:
            "Expanding List"
        case .scrollToRow:
            "Scroll To Specific Row"
        case .searchBarToFilterData:
            "Search Bar To Filter List Data"
        case .searchTokenToSearchField:
            "Search Token To Search Field"
        case .listFromBinding:
            "List From Binding"
        case .ListRowSeparatorInsets:
            "List Row Separator Insets"
        }
    }
    
    var destination: some View {
        return AnyView(ListView(listType: self))
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(ListType.allCases, id: \.self) { type in
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
