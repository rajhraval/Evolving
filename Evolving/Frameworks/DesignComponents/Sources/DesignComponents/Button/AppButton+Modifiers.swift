//
//  AppButton+Modifiers.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

#warning("Created these package back in May so some things are redundant")
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

public struct SymbolButtonStyle: ViewModifier {
    public let type: AppButtonType
    public func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(type == AppButtonType.secondary ? type.textColor : type.backgroundColor)
    }
}


public struct ChipButtonStyle: ViewModifier {
    public var isActive: Bool
    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .customSubtitle()
            .foregroundStyle(.white)
            .background(isActive ? Color.chipBackgroundActive : Color.chipBackround)
            .clipShape(.capsule)
    }
}

public struct NavigationButtonStyle: ViewModifier {
    public let type: AppButtonType
    public func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.circle)
            .tint(type.backgroundColor)
            .controlSize(.regular)
            .foregroundStyle(type.textColor)
    }
}
