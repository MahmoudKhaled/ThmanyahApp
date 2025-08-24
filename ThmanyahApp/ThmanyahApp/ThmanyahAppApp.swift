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
    
    init() {
        homeViewModel.useCase = useCase
    }
        
    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: homeViewModel)
                .preferredColorScheme(.dark)
        }
    }
}
