//
//  SectionType.swift
//  Domain
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

public enum SectionLayoutType: String, Sendable {
    case square = "square"
    case bigSquare = "big_square"
    case grid = "2_lines_grid"
    case queue = "queue"
    case none
    
    public init?(rawValue: String?) {
        guard let rawValue = rawValue else {
            return nil
        }

        let normalized = rawValue
            .replacingOccurrences(of: "_", with: " ")
            .lowercased()

        switch normalized {
        case "square":
            self = .square
        case "big square":
            self = .bigSquare
        case "2 lines grid":
            self = .grid
        case "queue":
            self = .queue
        default:
            self = .none
        }
    }
}
