//
//  SearchUseCase.swift
//  Central
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Network
import Domain

public struct SearchUseCase {
    private let client: SearchClientType
    private let networkClient = NetworkClient()
    
    public init() {
        client = SearchClient(networkClient: networkClient)
    }
}

extension SearchUseCase: SearchUseCaseType {
    
    public func search(with word: String) async throws -> [SectionEntity] {
        let response = try await client.search(with: word)
        return response.sections?.map({ $0.mapToEntity()}) ?? []
    }
}
