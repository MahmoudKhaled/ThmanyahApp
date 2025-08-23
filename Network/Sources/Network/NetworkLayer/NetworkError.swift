//
//  NetworkError.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

public enum NetworkError: Error {
    case badURL
    case invalidResponse
    case serverError(Int)  // includes status code
    case decodingError(Error)
    case unknown(Error)
}
