//
//  AppButtonType.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

internal protocol AppButtonStyle {
    var textColor: Color { get }
    var backgroundColor: Color { get }
}

public enum AppButtonType: AppButtonStyle {
    case primary
    case secondary
    case success
    case destructive
    case disabled
    case warning
    case edit
    case custom(color: Color)

    var textColor: Color {
        switch self {
        case .primary, .destructive, .disabled, .success, .warning, .edit:
            return .white
        case .secondary:
            return .indigo
        case .custom(let color):
            return color
        }
    }

    var backgroundColor: Color {
        switch self {
        case .primary:
            return .indigo
        case .secondary:
            return .indigo.opacity(0.15)
        case .success:
            return .green
        case .destructive:
            return .red
        case .disabled:
            return .gray
        case .warning:
            return .orange
        case .edit:
            return .blue
        case .custom(let color):
            return color
        }
    }
}

extension AppButtonType: Equatable {

}
