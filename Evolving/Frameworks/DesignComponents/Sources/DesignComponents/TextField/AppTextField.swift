//
//  AppTextField.swift
//  DesignComponents
//
//  Created by Raj Raval on 16/12/24.
//

import SwiftUI

public struct AppTextField: View {

    @Binding public var text: String
    var placeholder: String
    var isSearch: Bool

    public init(text: Binding<String>, placeholder: String, isSearch: Bool = false) {
        self._text = text
        self.placeholder = placeholder
        self.isSearch = isSearch
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .roundedTextField()
            if text.isEmpty {
                HStack(spacing: 6) {
                    if isSearch {
                        Image(systemName: "magnifyingglass")
                    }
                    Text("Search")
                        .foregroundStyle(.white)
                }
                .customSubtitle()
                .offset(x: .pLarge)
                .foregroundStyle(Color.searchSymbol)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        AppTextField(text: .constant(""), placeholder: "Search", isSearch: true)
            .padding(.horizontal, 24)
    }
}
