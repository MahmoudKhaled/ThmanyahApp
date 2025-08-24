//
//  HomeResponse+Entity.swift
//  Central
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Network
import Domain
import Foundation

extension HomeResponse {
    func mapToEntity() -> HomeEntity {
        return HomeEntity(
            section: sections?.map { $0.mapToEntity() } ?? [],
            totalPages: pagination?.totalPages ?? 1
        )
    }
}
