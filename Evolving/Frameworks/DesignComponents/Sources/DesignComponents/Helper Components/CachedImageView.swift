//
//  CachedImageView.swift
//  DesignComponents
//
//  Created by Raj Raval on 15/12/24.
//

import NukeUI
import SwiftUI

public struct CachedImageView: View {

    public var url: URL
    public var width: CGFloat? = nil
    public var height: CGFloat? = nil
    public var cornerRadius: CGFloat = 0    

    public init(url: URL, width: CGFloat? = nil, height: CGFloat? = nil, cornerRadius: CGFloat = 0) {
        self.url = url
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .clipShape(.rect(cornerRadius: cornerRadius))
                    .clipped()
            } else {
                Color.gray.opacity(0.5)
                    .frame(width: width, height: height)
                    .clipShape(.rect(cornerRadius: cornerRadius))
            }
        }
    }
}

#Preview {
    CachedImageView(url: URL(string: "https://prod-assets.evolveinc.in/media/journey/thumb/20231208074415.webp")!, height: 116)
}
