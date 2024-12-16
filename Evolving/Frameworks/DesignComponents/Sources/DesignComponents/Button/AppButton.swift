//
//  AppButton.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

public struct AppButton<Label: View>: View {

    public var label: () -> Label
    public var action: () -> Void

    public init(
        _ title: String,
        action: @escaping () -> Void
    ) where Label == Text {
        self.label = { Text(title) }
        self.action = action
    }

    public init(
        systemName: String,
        action: @escaping () -> Void
    ) where Label == Image {
        self.label = { Image(systemName: systemName) }
        self.action = action
    }

    public init(
        title: String,
        systemName: String,
        action: @escaping () -> Void
    ) where Label == AnyView {
        self.label = {
            AnyView(
                HStack(spacing: 4) {
                    Image(systemName: systemName)
                    Text(title)
                }
            )
        }
        self.action = action
    }


    public var body: some View {
        Button {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            action()
        } label: {
            if Label.self == Image.self {
                label()
            } else if Label.self == Text.self {
                label()
                    .frame(maxWidth: .infinity)
            } else {
                label()
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        AppButton(systemName: "checkmark") {

        }
        .navigationButtonStyle(.primary)
    }
}
