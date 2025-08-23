//
//  HomeClient.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

public protocol HomeClientType {
    func fetchHomeData() async throws -> HomeResponse
}

public struct HomeClient: HomeClientType {
    
    let networkClient: NetworkClientType
    
    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }
    
    public func fetchHomeData() async throws -> HomeResponse {
        let request = Request.build(with: "home_sections")
        return try await networkClient.sendRequest(request: request)
    }
}
