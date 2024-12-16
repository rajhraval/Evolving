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
        GridItem(.adaptive(minimum: 170), spacing: .regular2, alignment: .top),
        GridItem(.adaptive(minimum: 170), alignment: .top)
    ]

    private var title: some View {
        Text("Discover")
            .customTitle()
            .foregroundStyle(.white)
            .padding(.bottom, .mini)
    }

    private var searchBar: some View {
        AppTextField(text: $viewModel.searchText, placeholder: "Search", isSearch: true)
    }

    private var filterView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: .regular2) {
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

    @ViewBuilder
    private var gridView: some View {
        if viewModel.filteredItems.isEmpty {
            EmptyStateView(.noResults)
        } else {
            LazyVGrid(columns: columns, spacing: .medium) {
                ForEach(viewModel.filteredItems) { item in
                    ExploreItemView(item: item)
                        .task {
                            await viewModel.loadMoreIfNeeded(currentItem: item)
                        }
                }
                if viewModel.isLoading {
                    ProgressView()
                }
            }
        }
    }

    @ViewBuilder
    private var errorStateView: some View {
        if let error = viewModel.error {
            EmptyStateView(
                .errorState(
                    title: error.title,
                    description: error.description
                )
            )
        }
    }

    private var leftBarButton: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Explore")
                .customNavigationTitle()
                .foregroundStyle(.white)
        }
    }

    private var rightBarButton: some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Group {
                AppButton(systemName: "heart.fill") {}
                AppButton(systemName: "music.note") {}
            }
            .navigationButtonStyle(.primary)
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: .regular2) {
                    title
                    searchBar
                    VStack(spacing: .medium) {
                        if let _ = viewModel.error {
                            errorStateView
                        } else {
                            filterView
                            gridView
                        }
                    }
                    .scrollClipDisabled()
                }
                .padding(.horizontal, .regular3)
            }
            .scrollIndicators(.hidden)
            .background(Color.black)
            .toolbar {
                leftBarButton
                rightBarButton
            }
            .navigationTitle("Explore")
            .navigationStyle()
        }
        .task {
            await viewModel.loadExploreData()
        }
    }
}

#Preview {
    ExploreView()
}
