//
//  NetworkLogger.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

class NetworkLogger {

    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    private static func log(request: URLRequest) {
        print("\n - - - - - - - - - - OUTGOING - - - - - - - - - - \n")
        defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
        
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)
        
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        
        var logOutput = """
                        \(urlAsString) \n\n
                        \(method) \(path)?\(query) HTTP/1.1 \n
                        HOST: \(host)\n
                        """
        for (key, value) in request.allHTTPHeaderFields ?? [:] {
            logOutput += "\(key): \(value) \n"
        }
        if let body = request.httpBody {
            logOutput += "\n \(NSString(data: body, encoding: String.Encoding.utf8.rawValue) ?? "")"
        }
        
        print(logOutput)
    }
    
    static func log(error: Error?) {
        if NetworkLogger.isLoggingEnabled,
           error != nil {
            print("\n-----------------Error Response start------------------\n")
            print(error ?? "unable to print error")
        }
    }
    
    static func log(request: URLRequest, response: URLResponse?, data: Data?) {
        if NetworkLogger.isLoggingEnabled {
            log(request: request)
            if response != nil {
                print("\n-----------------Response start------------------\n")
                defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
                if let res = response as? HTTPURLResponse {
                    print("status code: \(res.statusCode) \n")
                }
                if let data = data {
                    print(String(decoding: data, as: UTF8.self))
                }
            }
        }
    }
}
