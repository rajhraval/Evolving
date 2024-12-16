//
//  TextField+Modifiers.swift
//  DesignComponents
//
//  Created by Raj Raval on 16/12/24.
//

import SwiftUI

public struct RoundedTextField: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, .pLarge)
            .padding(.vertical, .pTiny)
            .background(Color.textFieldBackground)
            .customSubtitle()
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

extension View {
    public func roundedTextField() -> some View {
        modifier(RoundedTextField())
    }
}
