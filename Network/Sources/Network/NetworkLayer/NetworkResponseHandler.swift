//
//  NetworkResponseHandler.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation
struct NetworkResponseHandler {
    
    func checkResponseError(response: URLResponse) throws {
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return
        case 400...499:
            throw NetworkError.serverError(httpResponse.statusCode)
        case 500...599:
            throw NetworkError.serverError(httpResponse.statusCode)
        default:
            throw NetworkError.invalidResponse
        }
    }
    
    func decodeData<ResponseType: Decodable>(with data: Data) throws -> ResponseType {
        do {
            return try JSONDecoder().decode(ResponseType.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
