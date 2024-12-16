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
    var error: APIError? = nil

    var searchText = ""
    var selectedProblem: ExploreProblemType = .all

    var exploreItems: [ExploreData] = []
    var exploreProblems: [ExploreProblemType] = [.all]

    var currentPage = 1
    var totalPages = 1
    var hasMorePages = true
    var isFetchingNextPage = false

    var filteredItems: [ExploreData] {
        exploreItems.filter { item in
            let matchesSearch = searchText.isEmpty ||
                item.title.localizedCaseInsensitiveContains(searchText)
            let matchesProblem = selectedProblem == .all ||
                item.problems.contains(selectedProblem.title)
            return matchesSearch && matchesProblem
        }
    }

    private let exploreService: ExploreService
    private let fileStorage: FileStorage
    private let cacheFileName = "explore_cache.json"
    
    // MARK: - Initialization
    
    init(
        exploreService: ExploreService = ExploreService(),
        fileStorage: FileStorage = FileStorage()
    ) {
        self.exploreService = exploreService
        self.fileStorage = fileStorage
    }
    
    func loadExploreData() async {
        if let cachedResponse = loadFromCache() {
            updateStateFromCache(cachedResponse)
            return
        }
        await fetchExploreData()
    }
    
    private func loadFromCache() -> ExploreResponse? {
        fileStorage.load(from: cacheFileName, as: ExploreResponse.self)
    }
    
    private func updateStateFromCache(_ cachedResponse: ExploreResponse) {
        exploreItems = cachedResponse.data
        exploreProblems = [.all] + cachedResponse.problemFilters
        totalPages = cachedResponse.metadata.totalPages
        
        // Calculate next page based on cached items
        let itemsPerPage = 10
        currentPage = (exploreItems.count / itemsPerPage) + 1
        hasMorePages = currentPage <= totalPages
    }
    
    private func fetchExploreData() async {
        guard !isFetchingNextPage else { return }
        
        isLoading = currentPage == 1
        isFetchingNextPage = true
        
        do {
            let response = try await exploreService.fetchExploreData(page: currentPage, limit: 10)

            hasMorePages = currentPage < response.metadata.totalPages
            currentPage += 1

            saveExploreResponse(response)
        } catch {
            self.error = error as? APIError
            debugPrint("Error fetching explore data: \(error)")
        }
        
        isLoading = false
        isFetchingNextPage = false
    }
    
    func loadMoreIfNeeded(currentItem item: ExploreData) async {
        guard !isFetchingNextPage && hasMorePages else { return }

        let thresholdIndex = exploreItems.index(exploreItems.endIndex, offsetBy: -3)
        guard let itemIndex = exploreItems.firstIndex(where: { $0.id == item.id }),
              itemIndex == thresholdIndex else {
            return
        }

        await fetchExploreData()
    }
    
    private func saveExploreResponse(_ exploreResponse: ExploreResponse) {
        if currentPage == 2 {
            exploreItems = exploreResponse.data
            exploreProblems = [.all] + exploreResponse.problemFilters
            totalPages = exploreResponse.metadata.totalPages
        } else {
            exploreItems.append(contentsOf: exploreResponse.data)
        }

        let cacheResponse = ExploreResponse(
            metadata: exploreResponse.metadata,
            data: exploreItems,
            problemFilters: exploreProblems.filter { $0 != .all }
        )
    
        fileStorage.save(cacheResponse, to: cacheFileName)
    }
}
