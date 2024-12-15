//
//  View+Spacing.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

public extension View {

    func size(_ size: CGSize) -> some View {
        modifier(SizeModifier(size: size))
    }

    func height(_ height: CGFloat) -> some View {
        modifier(HeightModifier(height: height))
    }

    func width(_ width: CGFloat) -> some View {
        modifier(WidthModifier(width: width))
    }

    func defaultCornerRadius(_ radius: CGFloat = .cornerRadius) -> some View {
        modifier(DefaultCornerRadius(radius: radius))
    }

    func upperCornerRadius(_ radius: CGFloat = .cornerRadius) -> some View {
        modifier(UpperCornerRadius(radius: radius))
    }

    func lowerCornerRadius(_ radius: CGFloat = .cornerRadius) -> some View {
        modifier(LowerCornerRadius(radius: radius))
    }

}
