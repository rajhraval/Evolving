//
//  ExploreViewModel.swift
//  Evolving
//
//  Created by Raj Raval on 15/12/24.
//

import Combine
import SwiftUI

@Observable @MainActor
class ExploreViewModel {

    var isLoading: Bool = false
    var searchText: String = ""
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

    let exploreService: MockExploreService

    init(exploreService: MockExploreService = MockExploreService()) {
        self.exploreService = exploreService
    }

    func fetchExploreData() {
        isLoading = true

        let exploreResponse = exploreService.fetchExploreData()
        exploreItems.append(contentsOf: exploreResponse.data)

        let problems = exploreResponse.problemFilters
        exploreProblems.append(contentsOf: problems)

        isLoading = false
    }

}
