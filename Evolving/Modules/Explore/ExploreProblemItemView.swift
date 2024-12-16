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
            HStack(spacing: 6) {
                Text(problem.title)
                if isSelected {
                    Image(systemName: "checkmark")
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                }
            }
        }
        .chipButtonStyle(isSelected)
    }
}

#Preview {
    ExploreProblemItemView(problem: .example, isSelected: false, onTap: {})
}
