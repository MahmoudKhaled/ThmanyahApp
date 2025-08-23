//
//  Headers.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

enum Headers {
    
    static var defaultHeaders: [String: String] {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        return [
            "X-Locale": "en",
            "appVersion": appVersion
        ]
    }
}
