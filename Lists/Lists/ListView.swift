//
//  ListView.swift
//  Lists
//
//  Created by Piyush Mandaliya on 2025-04-21.
//

import SwiftUI

struct ListView: View {
    let listType: ListType
    
    var body: some View {
        switch listType {
        case .staticList:
            staticList()
        case .dynamicList:
            dynamicList()
        case .deleteRows:
            deleteRows()
        case .moveRows:
            moveRows()
        case .listSection:
            listSection()
        case .listEditing:
            listEditing()
        case .listStyle:
            listStyle()
        case .expandingList:
            expandingList()
        case .scrollToRow:
            scrollToSpecificRow()
        case .searchBarToFilterData:
            searchBarToFilerData()
        case .searchTokenToSearchField:
            searchTokenToSearchField()
        case .listFromBinding:
            listFromBinding()
        case .ListRowSeparatorInsets:
            listRowSeparatorInsets()
        }
    }
    
    
    private func staticList() -> some View {
        List {
            Pizzeria(name: "Joe's Original")
            Pizzeria(name: "The Real Joe's Original")
            Pizzeria(name: "Original Joe's")
        }
    }
    
    private func dynamicList() -> some View {
        let restaurants = [
            Restaurant(name: "Joe's Original"),
            Restaurant(name: "The Real Joe's Original"),
            Restaurant(name: "Original Joe's")
        ]
        
        return List(restaurants) { restaurant in
            RestaurantRow(restaurant: restaurant)
        }
    }
    
    @State private var users = ["Glenn", "Malcolm", "Nicola", "Terri"]
    @State private var users1 = ["Raj", "Piyush", "Ashok", "Sahil"]
    private func deleteRows() -> some View {
        VStack {
            Section("Delete") {
                List($users, id: \.self, editActions: .delete) { $user in
                    Text(user)
                }
            }
            
            Section("Disable Delete for one row") {
                List($users, id: \.self, editActions: .delete) { $user in
                    Text(user)
                        .deleteDisabled(users.count < 2)
                }
            }
        }
    }
    
    private func moveRows() -> some View {
        NavigationStack {
            
            VStack {
                //            List($users, id: \.self, editActions: .move) { $user in
                //                Text(user)
                //                    .moveDisabled(user == "Glenn")
                //            }
                
                List {
                    ForEach(users, id: \.self) { user in
                        Text(user)
                            .moveDisabled(user == "Glenn")
                    }
                    .onMove(perform: move)
                }
                .toolbar {
                    EditButton()
                }
            }
        }
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        users.move(fromOffsets: source, toOffset: destination)
    }
    
    private func listSection() -> some View {
        List {
            Section(header: Text("Orginal Pizza")) {
                Pizzeria(name: "Joe's Original")
                Pizzeria(name: "The Real Joe's Original")
                Pizzeria(name: "Original Joe's")
            }
            
            Section(header: Text("Other Pizza")) {
                Pizzeria(name: "Joe's Original")
                Pizzeria(name: "The Real Joe's Original")
                Pizzeria(name: "Original Joe's")
            }
        }
    }
    
    private func listEditing() ->  some View {
        NavigationStack {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    
    
    @State private var selectedStyle = "Grouped"
    
    private func listStyle() -> some View {
        let options = ["Grouped", "insetGrouped"]
        return VStack {
            VStack(spacing: 20) {
                Picker("Options", selection: $selectedStyle) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(.segmented)
                
                if selectedStyle == "Grouped" {
                    List {
                        Section(header: Text("Examples")) {
                            Pizzeria(name: "Joe's Original")
                            Pizzeria(name: "The Real Joe's Original")
                            Pizzeria(name: "Original Joe's")
                        }
                    }
                    .listStyle(.grouped)
                } else {
                    List(0..<100) { i in
                        Text("Row \(i)")
                    }
                    .listStyle(.insetGrouped)
                }
            }
        }
    }
    
    private func expandingList() -> some View {
        let items: [Bookmark] = [.example1, .example2, .example3]
        
        return List(items, children: \.subItems) { row in
            HStack {
                Image(systemName: row.icon)
                Text(row.name)
            }
        }
    }
    
    private func scrollToSpecificRow() -> some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Jump to #50") {
                    proxy.scrollTo(50, anchor: .top)
                }
                
                List(0..<100, id: \.self) { i in
                    Text("Example \(i)")
                        .id(i)
                }
            }
        }
    }
    
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""
    @State private var messages = [Message]()
    @State private var searchScope = SearchScope.inbox
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
    
    var filteredMessages: [Message] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter { $0.text.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    private func searchBarToFilerData() -> some View {
//        NavigationStack {
//            List {
//                ForEach(searchResults, id: \.self) { name in
//                    NavigationLink {
//                        Text(name)
//                    } label: {
//                        Text(name)
//                    }
//                }
//            }
//            .navigationTitle("Contacts")
//        }
//        .searchable(text: $searchText) {
//            ForEach(searchResults, id: \.self) { result in
//                Text("Are you looking for \(result)?").searchCompletion(result)
//            }
//        }

        //Search Scope
        NavigationStack {
            List {
                ForEach(filteredMessages) { message in
                    VStack(alignment: .leading) {
                        Text(message.user)
                            .font(.headline)
                        
                        Text(message.text)
                    }
                }
            }
            .navigationTitle("Messages")
        }
        .searchable(text: $searchText)
        .searchScopes($searchScope) {
            ForEach(SearchScope.allCases, id: \.self) { scope in
                Text(scope.rawValue.capitalized)
            }
        }
        .onAppear(perform: runSearch)
        .onSubmit(of: .search, runSearch)
        .onChange(of: searchScope) { _ in runSearch() }
    }
    
    private func runSearch() {
        Task {
            guard let url = URL(string: "https://hws.dev/\(searchScope.rawValue).json") else { return }

            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        }
    }
    
    
    // All possible tokens we want to show to the user.
    let allTokens = [Token(name: "Action"), Token(name: "Comedy"), Token(name: "Drama"), Token(name: "Family"), Token(name: "Sci-Fi")]
    
    // The list of tokens the user currently has selected.
    @State private var currentTokens = [Token]()
    
    // The list of tokens we want to show to the user right now. Activates token selection only when searchText starts with #.
    var suggestedTokens: [Token] {
        if searchText.starts(with: "#") {
            return allTokens
        } else {
            return []
        }
    }
    
    // Some data to show and filter by.
    let movies = [
        Movie(name: "Avatar", genre: "Sci-Fi"),
        Movie(name: "Inception", genre: "Sci-Fi"),
        Movie(name: "Love Actually", genre: "Comedy"),
        Movie(name: "Paddington", genre: "Family")
    ]
    
    // The real work: filter all the movies based on search text or tokens.
    var searchResultsForSearchToken: [Movie] {
        // trim whitespace
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespaces)
        
        return movies.filter { movie in
            if searchText.isEmpty == false {
                // If we have search text, make sure this item matches.
                if movie.name.localizedCaseInsensitiveContains(trimmedSearchText) == false {
                    return false
                }
            }
            
            if currentTokens.isEmpty == false {
                // If we have search tokens, loop through them all to make sure one of them matches our movie.
                for token in currentTokens {
                    if token.name.localizedCaseInsensitiveContains(movie.genre) {
                        return true
                    }
                }
                
                // This movie does *not* match any of our tokens, so it shouldn't be sent back.
                return false
            }
            
            // If we're still here then the movie should be included.
            return true
        }
    }
    
    private func searchTokenToSearchField() -> some View {
        NavigationStack {
            List(searchResultsForSearchToken) { movie in
                Text(movie.name)
            }
            .navigationTitle("Movies+")
            .searchable(text: $searchText, tokens: $currentTokens, suggestedTokens: .constant(suggestedTokens), prompt: Text("Type to filter, or use # for tags")) { token in
                Text(token.name)
            }
        }
    }
    
    @State private var usersList: [User] = [
        User(name: "Taylor"),
        User(name: "Justin"),
        User(name: "Adele")
    ]
    private func listFromBinding() -> some View {
        List($usersList) { $user in
            HStack {
                Text(user.name)
                
                Spacer()
                
                Toggle("", isOn: $user.isContacted)
                    .labelsHidden()
            }
        }
    }
    
    private func listRowSeparatorInsets() -> some View {
        List {
            ForEach(0..<10) { i in
                HStack {
                    Text("Row \(i)")
                }
                .alignmentGuide(.listRowSeparatorLeading) { d in
                    return d[.leading] + 100 // Force shift separator 100 pts
                }
            }
        }
        .listStyle(.plain)
    }
}


struct User: Identifiable {
    let id = UUID()
    var name: String
    var isContacted = false
}

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
}


struct Pizzeria: View {
    let name: String

    var body: some View {
        Text("Restaurant: \(name)")
    }
}

struct RestaurantRow: View {
    var restaurant: Restaurant

    var body: some View {
        Text("Come and eat at \(restaurant.name)")
    }
}

struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var subItems: [Bookmark]?
    
    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")
    
    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", subItems: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", subItems: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", subItems: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}



struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}


//Search Token In Search Field

// Holds one uniquely identifiable movie.
struct Movie: Identifiable {
    var id = UUID()
    var name: String
    var genre: String
}

// Holds one token that we want the user to filter by. This *must* conform to Identifiable.
struct Token: Identifiable {
    var id: String { name }
    var name: String
}


#Preview {
    ListView(listType: .ListRowSeparatorInsets)
}
