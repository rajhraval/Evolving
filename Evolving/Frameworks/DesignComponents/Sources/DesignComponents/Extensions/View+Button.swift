//
//  View+Button.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

public extension View {

    func roundedButtonStyle(_ style: AppButtonType) -> some View {
        modifier(RoundedButtonStyle(type: style))
    }

    func symbolButtonStyle(_ style: AppButtonType) -> some View {
        modifier(SymbolButtonStyle(type: style))
    }

    func chipButtonStyle(_ isActive: Bool) -> some View {
        modifier(ChipButtonStyle(isActive: isActive))
    }

    func navigationButtonStyle(_ style: AppButtonType) -> some View {
        modifier(NavigationButtonStyle(type: style))
    }

}
