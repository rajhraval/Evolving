//
//  ExploreItemView.swift
//  Evolving
//
//  Created by Raj Raval on 15/12/24.
//

import SwiftUI

struct ExploreItemView: View {
    
    let item: ExploreData

    private var image: some View {
        CachedImageView(
            url: item.thumbnailURL,
            width: 170,
            cornerRadius: 12
        )
    }

    @ViewBuilder
    private var lockBackground: some View {
        if item.isPremium {
            ZStack {
                Circle()
                    .fill(Color.lockBackground.tertiary)
                Image(systemName: "lock.fill")
                    .foregroundStyle(.white)
            }
            .size(.large)
            .padding(.regular)
        }
    }

    var infoDescription: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text(item.title)
                .customHeadline()
                .foregroundStyle(.white)
            HStack(spacing: .small) {
                Text(item.sessions)
                Text("•")
                Text(item.mins)
            }
            .lineLimit(1)
            .customCaption()
            .foregroundStyle(.white.secondary)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: .regular) {
            image
                .overlay(alignment: .bottomLeading) {
                    lockBackground
                }
            infoDescription
        }
    }
}

#Preview {
    ZStack {
        Color.black
        ExploreItemView(item: .mockData)
    }
}
