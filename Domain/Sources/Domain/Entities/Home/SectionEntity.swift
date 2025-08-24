//
//  SectionEntity.swift
//  Domain
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

public struct SectionEntity: Identifiable, Sendable, Equatable {
    public let id = UUID()
    public let title: String
    public let layoutType: SectionLayoutType
    public let contentType: SectionContentType
    public let items: [SectionItemEntity]
    
    public init (
        title: String,
        layoutType: SectionLayoutType,
        contentType: SectionContentType,
        items: [SectionItemEntity]
    ) {
        self.title = title
        self.layoutType = layoutType
        self.contentType = contentType
        self.items = items
    }
    
    public static func == (lhs: SectionEntity, rhs: SectionEntity) -> Bool {
        return lhs.id == rhs.id
    }
}
