//
//  ExploreViewModel.swift
//  Evolving
//
//  Created by Raj Raval on 15/12/24.
//

import SwiftUI

@Observable @MainActor
class ExploreViewModel {

    var isLoading = false
    var hasMorePages = true
    var isFetchingNextPage = false
    var error: APIError? = nil

    var currentPage = 1
    var totalPages = 1

    var searchText = ""
    var selectedProblem: ExploreProblemType = .all

    var exploreItems: [ExploreData] = []
    var exploreProblems: [ExploreProblemType] = [.all]

    var filteredItems: [ExploreData] {
        exploreItems.filter { item in
            let matchesSearch = searchText.isEmpty || item.title.localizedCaseInsensitiveContains(searchText)
            let matchesProblem = selectedProblem == .all || item.problems.contains(selectedProblem.title)
            return matchesSearch && matchesProblem
        }
    }

    private let exploreService: ExploreService
    private let fileStorage: FileStorage
    private let cacheFileName = "explore_cache.json"

    init(
        exploreService: ExploreService = ExploreService(),
        fileStorage: FileStorage = FileStorage()
    ) {
        self.exploreService = exploreService
        self.fileStorage = fileStorage
        loadFromCache()
    }
    
    func fetchExploreData() async {
        guard !isFetchingNextPage else { return }
        isLoading = currentPage == 1
        isFetchingNextPage = true
        
        do {
            let exploreResponse = try await exploreService.fetchExploreData(
                page: currentPage,
                limit: 10
            )
            saveExploreResponse(exploreResponse)
            hasMorePages = currentPage < exploreResponse.metadata.totalPages
            currentPage += 1
        } catch {
            if currentPage == 1 {
                loadFromCache()
            }
            self.error = error as? APIError
            debugPrint("Error fetching explore data: \(error)")
        }
        
        isLoading = false
        isFetchingNextPage = false
    }
    
    func loadMoreIfNeeded(currentItem item: ExploreData) async {
        let thresholdIndex = exploreItems.index(exploreItems.endIndex, offsetBy: -3)
        if let itemIndex = exploreItems.firstIndex(where: { $0.id == item.id }),
           itemIndex == thresholdIndex,
           hasMorePages {
            await fetchExploreData()
        }
    }

    private func saveExploreResponse(_ exploreResponse: ExploreResponse) {
        if currentPage == 1 {
            exploreItems = exploreResponse.data
            exploreProblems = [.all] + exploreResponse.problemFilters
            totalPages = exploreResponse.metadata.totalPages
            saveToCache(exploreResponse)
        } else {
            exploreItems.append(contentsOf: exploreResponse.data)
        }
    }

}

extension ExploreViewModel {
    
    func saveToCache(_ exploreResponse: ExploreResponse) {
        let data = exploreResponse.data
        fileStorage.save(data, to: cacheFileName)
    }
    
    func loadFromCache() {
        if let data = fileStorage.load(from: cacheFileName, as: ExploreResponse.self) {
            exploreItems = data.data
            exploreProblems = [.all] + data.problemFilters
            totalPages = data.metadata.totalPages
        }
    }
}
