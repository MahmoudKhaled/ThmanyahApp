//
//  Encodable+Extension.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

extension Encodable {
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

        return jsonObject.flatMap { $0 as? [String: Any] } ?? [:]

    }

    func toData() -> Data? {
        try? JSONSerialization.data(withJSONObject: self.toDictionary(), options: .prettyPrinted)
    }
}
