//
//  ExploreProblemItemView.swift
//  Evolving
//
//  Created by Raj Raval on 15/12/24.
//

import SwiftUI

struct ExploreProblemItemView: View {

    var problem: ExploreProblemType
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Text(problem.title)
                .foregroundStyle(.white)
        }
        .buttonStyle(.borderedProminent)
        .tint(isSelected ? .red : .blue)
    }
}

#Preview {
    ExploreProblemItemView(problem: .example, isSelected: false, onTap: {})
}
