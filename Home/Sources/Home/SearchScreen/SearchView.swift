//
//  SearchScreen.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import SwiftUI

public struct SearchScreen: View {
    
    @ObservedObject var searchViewModel: SearchViewModel
    
    public init(searchViewModel: SearchViewModel) {
        self.searchViewModel = searchViewModel
    }

    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                List {
                    SearchBar(
                        text: $searchViewModel.searchText,
                        placeholder: "Search..."
                    )
                    ForEach(searchViewModel.sections, id: \.id) { section in
                        SectionView(section: section)
                    }
                }
                .listRowSeparator(.hidden)
                .listStyle(.plain)
            }
        }
        .onAppear {
            searchViewModel.viewAppeared()
        }
        .background(Color("#141520").edgesIgnoringSafeArea(.all))
    }
}
