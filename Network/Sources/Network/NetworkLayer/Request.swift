//
//  ThamnyahRequest.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

struct Request {
    
    static func build(with path: String,
                      method: HTTPMethod = .get,
                      urlParameters: [String: String] = [:],
                      headers: [String: String] = [:],
                      body: Encodable? = nil) -> URLRequest {
        let headers = headers.merging(Headers.defaultHeaders,
                                      uniquingKeysWith: { $1 })
        return URLRequestBuilder(baseUrl: "https://api-v2-b2sit6oh3a-uc.a.run.app",
                                 path: path)
        .set(method: method)
        .set(headers: headers)
        .set(parameters: urlParameters)
        .set(body: body)
        .build()
    }
}
