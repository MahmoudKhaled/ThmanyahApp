//
//  SearchUseCaseType.swift
//  Domain
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Foundation

public protocol SearchUseCaseType {
    func search(with word: String) async throws -> [SectionEntity]
}
