//
//  ExploreView.swift
//  Evolving
//
//  Created by Raj Raval on 15/12/24.
//

import SwiftUI

struct ExploreView: View {

    @State private var viewModel = ExploreViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 14, alignment: .top),
        GridItem(.flexible(), alignment: .top)
    ]

    private var filterView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 14) {
                ForEach(viewModel.exploreProblems) { problem in
                    ExploreProblemItemView(
                        problem: problem,
                        isSelected: viewModel.selectedProblem == problem
                    ){
                        viewModel.selectedProblem = problem
                    }
                }
            }
        }
    }

    private var gridView: some View {
        LazyVGrid(columns: columns, spacing: 24) {
            ForEach(viewModel.filteredItems) { item in
                ExploreItemView(item: item)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        filterView
                        gridView
                    }
                }
                .scrollClipDisabled()
                .padding(.horizontal, 20)
            }
            .scrollIndicators(.hidden)
            .onAppear {
                viewModel.fetchExploreData()
            }
            .searchable(text: $viewModel.searchText, prompt: Text("Search"))
        }
    }
}

#Preview {
    ExploreView()
}
