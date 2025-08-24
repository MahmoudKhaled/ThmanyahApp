//
//  HomeResponse.swift
//  Network
//
//  Created by Mahmoud Khaled on 23/08/2025.
//

import Foundation

// MARK: - HomeDTO

public struct HomeResponse: Decodable {
    public let sections: [SectionResponse]?
    public let pagination: PaginationResponse?
}

// MARK: - Pagination

public struct PaginationResponse: Decodable {
    public let nextPage: String?
    public let totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
}

// MARK: - Section

public struct SectionResponse: Decodable {
    public let name, type, contentType: String?
    public let order: Int
    public let content: [SectionItemResponse]?

    enum CodingKeys: String, CodingKey {
        case name, type
        case contentType = "content_type"
        case order
        case content
    }
}

// MARK: - Content

public struct SectionItemResponse: Decodable {
    public let podcastID, name, description: String?
    public let avatarURL: String?
    public let episodeCount, duration: Int?
    public let language: String?
    public let priority, popularityScore: Int?
    public let score: Double?
    public let podcastPopularityScore, podcastPriority: Int?
    public let episodeID: String?
    public let seasonNumber: String?
    public let episodeType: String?
    public let podcastName: String?
    public let authorName: String?
    public let number: String?
    public let separatedAudioURL, audioURL: String?
    public let releaseDate: String?
    public let chapters: [String]?
    public let paidIsEarlyAccess, paidIsNowEarlyAccess, paidIsExclusive: Bool?
    public let paidTranscriptURL, freeTranscriptURL: String?
    public let paidIsExclusivePartially: Bool?
    public let paidExclusiveStartTime: Int?
    public let paidEarlyAccessDate, paidEarlyAccessAudioURL, paidExclusivityType: String?
    public let audiobookID: String?
    public let articleID: String?

    enum CodingKeys: String, CodingKey {
        case podcastID = "podcast_id"
        case name, description
        case avatarURL = "avatar_url"
        case episodeCount = "episode_count"
        case duration, language, priority, popularityScore, score, podcastPopularityScore, podcastPriority
        case episodeID = "episode_id"
        case seasonNumber = "season_number"
        case episodeType = "episode_type"
        case podcastName = "podcast_name"
        case authorName = "author_name"
        case number
        case separatedAudioURL = "separated_audio_url"
        case audioURL = "audio_url"
        case releaseDate = "release_date"
        case chapters
        case paidIsEarlyAccess = "paid_is_early_access"
        case paidIsNowEarlyAccess = "paid_is_now_early_access"
        case paidIsExclusive = "paid_is_exclusive"
        case paidTranscriptURL = "paid_transcript_url"
        case freeTranscriptURL = "free_transcript_url"
        case paidIsExclusivePartially = "paid_is_exclusive_partially"
        case paidExclusiveStartTime = "paid_exclusive_start_time"
        case paidEarlyAccessDate = "paid_early_access_date"
        case paidEarlyAccessAudioURL = "paid_early_access_audio_url"
        case paidExclusivityType = "paid_exclusivity_type"
        case audiobookID = "audiobook_id"
        case articleID = "article_id"
    }
}
