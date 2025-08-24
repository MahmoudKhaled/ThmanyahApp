//
//  ThmanyahAppApp.swift
//  ThmanyahApp
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import SwiftUI
import Home
import Central

@main
struct ThmanyahAppApp: App {
    
    let useCase = HomeUseCase()
    var homeViewModel = HomeViewModel()
    @StateObject var homeRouter = HomeRouter()
    
    init() {
        homeViewModel.useCase = useCase
    }
        
    var body: some Scene {
        WindowGroup {
            ZStack {
                HomeView(
                    homeViewModel: homeViewModel,
                    router: homeRouter
                )
                .preferredColorScheme(.dark)
            }
            .sheet(item: $homeRouter.presentedScreen) { screen in
                switch screen {
                case .search(let vm):
                    SearchScreen(searchViewModel: vm)
                }
            }
        }
    }
}
