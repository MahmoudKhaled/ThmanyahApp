//
//  HomeView.swift
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import SwiftUI

public struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    public init (homeViewModel: HomeViewModel) {
        self.viewModel = homeViewModel
    }
    
    public var body: some View {
        VStack {
            HeaderView()
            List {
                ForEach (viewModel.sectionItems, id: \.id) { section in
                    SectionView(section: section)
                        .onAppear {
                            if section == viewModel.sectionItems.last {
                                Task {
                                    await viewModel.getHomeData()
                                }
                            }
                        }
                }
            }
            .listRowSeparator(.hidden)
            .listStyle(.plain)
        }
        .task {
            await viewModel.getHomeData()
        }
    }
}
