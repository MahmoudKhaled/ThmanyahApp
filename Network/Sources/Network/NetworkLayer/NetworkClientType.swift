//
//  NetworkClientType.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

public protocol NetworkClientType {
    func sendRequest<ResponseType: Decodable>(request: URLRequest) async throws -> ResponseType
}

public class NetworkClient {
    
    let session: URLSession
    
    public init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
}

extension NetworkClient: NetworkClientType {
    public func sendRequest<ResponseType: Decodable>(request: URLRequest) async throws -> ResponseType {
        do {
            let networkResponseHandler = NetworkResponseHandler()
            let (data, response) = try await session.data(for: request)
            NetworkLogger.log(request: request, response: response, data: data)
            try networkResponseHandler.checkResponseError(response: response)
            return try networkResponseHandler.decodeData(with: data)

        } catch {
            NetworkLogger.log(error: error)
            throw error
        }
    }
}
