//
//  SectionResponse+Entity.swift
//  Central
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Network
import Domain
import Foundation

extension SectionResponse {
    func mapToEntity() -> SectionEntity {
        SectionEntity(
            title: name ?? "",
            layoutType: SectionLayoutType(rawValue: type) ?? .none,
            contentType: SectionContentType(rawValue: contentType ?? "") ?? .none,
            items: content?.map {$0.mapToEntity()} ?? []
        )
    }
}
