//
//  URLRequestBuilder.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

public final class URLRequestBuilder {
    
    let baseUrl: String
    let path: String
    var headers: [String: String] = [:]
    var urlParameters: [String: String] = [:]
    var body: Encodable?
    var method: HTTPMethod = .get

    public init(baseUrl: String,
                path: String) {
        self.baseUrl = baseUrl
        self.path = path
        headers["Content-Type"] = "application/json"
    }

    @discardableResult
    public func set(method: HTTPMethod) -> Self {
        self.method = method
        return self
    }

    @discardableResult
    public func set(headers: [String: String]) -> Self {
        self.headers.merge(headers) { $1 }
        return self
    }

    @discardableResult
    public func set(parameters: [String: String]) -> Self {
        self.urlParameters = parameters
        return self
    }

    @discardableResult
    public func set(body: Encodable?) -> Self {
        self.body = body
        return self
    }

    public func build() -> URLRequest {
        let url = URL(string: self.baseUrl)!.appendingPathComponent(path)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = urlParameters.map {key, value in
            URLQueryItem(name: key,
                         value: value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        }
        var request = URLRequest(url: (urlComponents?.url!)!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60.0)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = body?.toData()
        return request

    }
}
