//
//  HomeUseCase.swift
//  Central
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Network
import Domain

public struct HomeUseCase {
    private let client: HomeClientType
    init(client: HomeClientType) {
        self.client = client
    }
}

extension HomeUseCase: HomeUseCaseType {
    public func fetchHomeData() async throws -> HomeEntity {
        let response = try await client.fetchHomeData(from: 1)
        return response.mapToEntity()
    }
}
