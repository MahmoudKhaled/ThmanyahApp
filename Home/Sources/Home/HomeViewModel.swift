//
//  HomeViewModel.swift
//  Home
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Domain
import Foundation
import Combine

@MainActor
public class HomeViewModel: ObservableObject {
    
    @Published var sectionItems: [SectionEntity] = []
    public var useCase: HomeUseCaseType?
    
    private var lastPage: Int = 1
    private var currentPage: Int = 0
    
    public init() { }
//    public init(useCase: HomeUseCaseType) {
//        self.useCase = useCase
//    }
}

extension HomeViewModel {
    
    public func getHomeData() async {
        guard currentPage < lastPage else { return }
        currentPage += 1
        do {
            let homeEntity = try await useCase?.fetchHomeData(with: currentPage)
            sectionItems.append(contentsOf: homeEntity?.section ?? [])
            lastPage = homeEntity?.totalPages ?? 1
        } catch {
            print("Error")
        }
    }
}

