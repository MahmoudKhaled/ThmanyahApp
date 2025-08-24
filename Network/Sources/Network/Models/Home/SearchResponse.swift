//
//  SearchResponse.swift
//  Network
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Foundation

public struct SearchResponse: Decodable {
    public let sections: [SectionResponse]?
}
