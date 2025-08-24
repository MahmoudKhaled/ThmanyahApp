//
//  SearchViewModel.swift
//  Home
//
//  Created by Mahmoud Khaled on 24/08/2025.
//

import Combine
import Foundation
import Domain

@MainActor
public class SearchViewModel: ObservableObject {
    
    private var cancellable = Set<AnyCancellable>()
    @Published var searchText: String = ""
    @Published var sections: [SectionEntity] = []

    public var useCase: SearchUseCaseType?
    public init() { }

    func viewAppeared() {
        $searchText
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.searchQuery(word: text)
            }.store(in: &cancellable)
    }

    private func searchQuery(word: String) {
        Task {
            do {
                sections = try await useCase?.search(with: word) ?? []
            } catch {
                print("Error")
            }
        }
    }
}
