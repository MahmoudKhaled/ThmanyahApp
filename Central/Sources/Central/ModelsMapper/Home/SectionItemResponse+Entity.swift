//
//  SectionItemResponse+Entity.swift
//  Central
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Network
import Domain
import Foundation

extension SectionItemResponse {
    func mapToEntity() -> SectionItemEntity {
        // id would contain from the api but api return duplicated ids
        return SectionItemEntity(
            id: UUID().uuidString,
            imageURL: URL(string: avatarURL ?? ""),
            title: name ?? "",
            duration: duration ?? 0)
    }
}
