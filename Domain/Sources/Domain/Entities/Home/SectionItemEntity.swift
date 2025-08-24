//
//  SectionItemEntity.swift
//  Domain
//
//  Created by Mahmoud Khaled on 23/08/2025.
//
import Foundation

public struct SectionItemEntity: Identifiable, Sendable {
    public let id: String
    public let imageURL: URL?
    public let title: String
    public let duration: Int
    
    public init(id: String,
                imageURL: URL?,
                title: String,
                duration: Int) {
        self.id = id
        self.imageURL = imageURL
        self.title = title
        self.duration = duration
    }
}
