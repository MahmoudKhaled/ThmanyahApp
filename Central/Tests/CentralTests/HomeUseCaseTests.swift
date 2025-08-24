import XCTest
@testable import Central
@testable import Domain
@testable import Network

final class HomeUseCaseTests: XCTestCase {
    
    private var mockClient: MockHomeClient!
    private var homeUseCase: HomeUseCase!

    override func setUpWithError() throws {
        mockClient = MockHomeClient()
        homeUseCase = HomeUseCase(client: mockClient)
    }

    override func tearDownWithError() throws {
        mockClient = nil
        homeUseCase = nil
    }
    
    func test_fetchHomeData_success() async throws {
        // Given
        mockClient.stubbedResponse = homeResponse
                
        // When
        let result = try await homeUseCase.fetchHomeData(with: 1)
        
        // then
        XCTAssertEqual(result.section.count, 1)
        XCTAssertEqual(result.totalPages, 10)
        XCTAssertEqual(result.section.first?.title, "Top Podcasts")
        XCTAssertEqual(result.section.first?.contentType, .podcast)
    }
    
    func test_fetchHomeData_failure() async {
        // Given
        mockClient.stubbedError = URLError(.badServerResponse)
        do {
            let _ = try await homeUseCase.fetchHomeData(with: 1)
            XCTFail("this test case should fail")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}

extension HomeUseCaseTests {
    
    var homeResponse: HomeResponse {
        HomeResponse(
            sections: [
                SectionResponse(
                    name: "Top Podcasts",
                    type: "square",
                    contentType: "podcast",
                    order: 0,
                    content: [
                        SectionItemResponse(
                            podcastID: "123",
                            name: "Swift Talk",
                            description: "Podcast about Swift",
                            avatarURL: "https://example.com/image.png",
                            episodeCount: 50,
                            duration: 1200,
                            language: "en",
                            priority: nil,
                            popularityScore: nil,
                            score: nil,
                            podcastPopularityScore: nil,
                            podcastPriority: nil,
                            episodeID: nil,
                            seasonNumber: nil,
                            episodeType: nil,
                            podcastName: nil,
                            authorName: nil,
                            number: nil,
                            separatedAudioURL: nil,
                            audioURL: nil,
                            releaseDate: nil,
                            chapters: nil,
                            paidIsEarlyAccess: nil,
                            paidIsNowEarlyAccess: nil,
                            paidIsExclusive: nil,
                            paidTranscriptURL: nil,
                            freeTranscriptURL: nil,
                            paidIsExclusivePartially: nil,
                            paidExclusiveStartTime: nil,
                            paidEarlyAccessDate: nil,
                            paidEarlyAccessAudioURL: nil,
                            paidExclusivityType: nil,
                            audiobookID: nil,
                            articleID: nil
                        )
                    ]
                )
            ],
            pagination: PaginationResponse(nextPage: "2", totalPages: 10)
        )
    }
}
