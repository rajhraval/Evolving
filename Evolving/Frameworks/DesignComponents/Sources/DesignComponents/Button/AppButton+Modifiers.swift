//
//  AppButton+Modifiers.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

public struct RoundedButtonStyle: ViewModifier {
    public let type: AppButtonType
    public func body(content: Content) -> some View {
        content
            .padding(.vertical, 14)
            .foregroundStyle(type.textColor)
            .background(type.backgroundColor)
            .clipShape(.rect(cornerRadius: .cornerRadius))
    }
}

public struct ChipButtonStyle: ViewModifier {
    public let type: AppButtonType
    public func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(type == AppButtonType.secondary ? type.textColor : type.backgroundColor)
            .buttonBorderShape(.capsule)
    }
}

public struct SymbolButtonStyle: ViewModifier {
    public let type: AppButtonType
    public func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(type == AppButtonType.secondary ? type.textColor : type.backgroundColor)
    }
}
