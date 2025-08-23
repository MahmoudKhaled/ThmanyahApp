//
//  HomeUseCaseType.swift
//  Domain
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

public protocol HomeUseCaseType {
    func fetchHomeData() async throws -> HomeEntity
}
