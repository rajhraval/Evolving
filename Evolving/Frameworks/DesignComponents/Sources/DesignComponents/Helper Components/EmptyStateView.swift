//
//  EmptyStateView.swift
//  DesignComponents
//
//  Created by Raj Raval on 16/12/24.
//

import SwiftUI

public enum EmptyStateType {
    case noResults
    case errorState(title: String, description: String)

    var imageText: String {
        switch self {
        case .noResults: 
            return "😕"
        case .errorState(_, _):
            return "📡"
        }
    }
    
    var title: String {
        switch self {
        case .noResults: 
            return "No Results Found"
        case .errorState(let title, _):
            return title
        }
    }
    
    var subtitle: String {
        switch self {
        case .noResults: 
            return "Maybe you might be looking for something else"
        case .errorState(_, let description):
            return description
        }
    }
}

public struct EmptyStateView: View {
    let type: EmptyStateType
    
    public init(_ type: EmptyStateType) {
        self.type = type
    }
    
    public var body: some View {
        VStack(spacing: .regular2) {
            Text(type.imageText)
                .customNavigationTitle()
            VStack(spacing: .small) {
                Text(type.title)
                    .customHeadline()
                    .foregroundStyle(.white)
                Text(type.subtitle)
                    .customSubtitle()
                    .foregroundStyle(.white.secondary)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .multilineTextAlignment(.center)
    }
}
