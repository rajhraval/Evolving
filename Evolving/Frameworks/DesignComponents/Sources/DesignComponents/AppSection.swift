//
//  AppSection.swift
//
//
//  Created by Raj Raval on 10/05/24.
//

import SwiftUI

public struct AppSection<Content: View>: View {

    public var title: String
    public var content: () -> Content

    public init(title: String, @ViewBuilder content: @escaping () -> Content = { EmptyView() }) {
        self.title = title
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text(title)
            content()
        }
    }
}
