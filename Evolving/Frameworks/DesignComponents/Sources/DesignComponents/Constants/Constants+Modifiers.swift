//
//  Constants+Modifiers.swift
//
//
//  Created by Raj Raval on 10/05/24.
//

import SwiftUI

public struct SizeModifier: ViewModifier {
    public let size: CGSize
    public func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height)
    }
}

public struct HeightModifier: ViewModifier {
    public let height: CGFloat
    public func body(content: Content) -> some View {
        content
            .frame(height: height)
    }
}

public struct WidthModifier: ViewModifier {
    public let width: CGFloat
    public func body(content: Content) -> some View {
        content
            .frame(height: width)
    }
}

public struct DefaultCornerRadius: ViewModifier {
    public let radius: CGFloat
    public func body(content: Content) -> some View {
        content
            .clipShape(.rect(cornerRadius: radius, style: .continuous))
    }
}

public struct UpperCornerRadius: ViewModifier {
    public let radius: CGFloat
    public func body(content: Content) -> some View {
        content
            .clipShape(
                UnevenRoundedRectangle(topLeadingRadius: radius, topTrailingRadius: radius)
            )
    }
}

public struct LowerCornerRadius: ViewModifier {
    public let radius: CGFloat
    public func body(content: Content) -> some View {
        content
            .clipShape(
                UnevenRoundedRectangle(bottomLeadingRadius: radius, bottomTrailingRadius: radius)
            )
    }
}
