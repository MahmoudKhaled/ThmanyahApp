//
//  SectionContentType.swift
//  Domain
//
//  Created by Mahmoud Khaled on 23/08/2025.
//
import SwiftUI

public enum SectionContentType: String, Sendable {
    case podcast = "podcast"
    case episode = "episode"
    case audioBook = "audio_book"
    case audioArticle = "audio_article"
    case none
    
    public var titleColor: Color {
        switch self {
        case .podcast:
            return .yellow
        default:
            return .white
        }
    }
}
