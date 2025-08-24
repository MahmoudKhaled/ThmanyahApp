//
//  HomeRouter.swift
//  ThmanyahApp
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Home
import SwiftUI
import Central

final class HomeRouter: @preconcurrency HomeRouterType, ObservableObject {
    
    @Published var presentedScreen: PresentedScreen?
    
    private let searchUseCase = SearchUseCase()
    
    enum PresentedScreen: Identifiable {
        case search(SearchViewModel)
        
        var id: String {
            switch self {
            case .search: return "search"
            }
        }
    }
    
    @MainActor func navigateToSearch() {
        let vm = SearchViewModel()
        vm.useCase = searchUseCase
        presentedScreen = .search(vm)
    }
}

