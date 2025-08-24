//
//  SearchClient.swift
//  Network
//
//  Created by Mahmoud Khaled on 24/08/2025.
//


import Foundation

public protocol SearchClientType {
    func search(with word: String) async throws -> SearchResponse
}

public struct SearchClient: SearchClientType {
    
    private let networkClient: NetworkClientType
    
    public init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }
    
    public func search(with word: String) async throws -> SearchResponse {
        let request = Request.build(
            baseUrl: "https://mock.apidog.com/m1",
            with: "735111-711675-default/search",
            urlParameters: ["word": word])
        return try await networkClient.sendRequest(request: request)
    }
}
