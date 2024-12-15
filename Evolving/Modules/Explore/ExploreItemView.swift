//
//  ExploreItemView.swift
//  Evolving
//
//  Created by Raj Raval on 15/12/24.
//

import SwiftUI
import Nuke

struct ExploreItemView: View {
    
    let item: ExploreData

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            CachedImageView(
                url: item.thumbnailURL,
                height: 116,
                cornerRadius: 12
            )
            VStack(alignment: .leading, spacing: 8) {
                Text(item.title)
                    .lineLimit(2)
                    .font(.headline)
                HStack(spacing: 8) {
                    Text(item.sessions)
                    Text("•")
                    Text(item.mins)
                }
                .lineLimit(1)
                .font(.footnote)
            }
        }
    }
}

#Preview {
    ExploreItemView(item: .mockData)
}
