//
//  File.swift
//  Central
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Foundation
@testable import Central
@testable import Network
@testable import Domain

final class MockHomeClient: HomeClientType {
    var stubbedResponse: HomeResponse?
    var stubbedError: Error?
    
    func fetchHomeData(from page: Int) async throws -> HomeResponse {
        if let error = stubbedError {
            throw error
        }
        if let response = stubbedResponse {
            return response
        }
        throw URLError(.badURL) // fallback
    }
}

