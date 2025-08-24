//
//  HomeEntity.swift
//  Domain
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

public struct HomeEntity: Sendable {
    
    public let section: [SectionEntity]
    public let totalPages: Int
    
    public init(section: [SectionEntity],
         totalPages: Int) {
        self.section = section
        self.totalPages = totalPages
    }
}
