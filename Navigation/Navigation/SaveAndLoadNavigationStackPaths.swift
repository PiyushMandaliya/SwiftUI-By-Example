//
//  SaveAndLoadNavigationStackPaths.swift
//  Navigation
//
//  Created by Piyush Mandaliya on 2025-05-04.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    private func save() {
        guard let represenation = path.codable else { return }
        
        do {
            let encoded = try JSONEncoder().encode(represenation)
            try encoded.write(to: savePath)
        } catch {
            print("Failed to save navigation data: \(error)")
        }
    }
}


struct MyDetailView: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go To Random Number", value: Int.random(in: 1...5000))
            .navigationTitle("Number \(number)")
    }
}

struct SaveAndLoadNavigationStackPaths: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            MyDetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    MyDetailView(number: i)
                }
        }
    }
}


#Preview {
    SaveAndLoadNavigationStackPaths()
}
