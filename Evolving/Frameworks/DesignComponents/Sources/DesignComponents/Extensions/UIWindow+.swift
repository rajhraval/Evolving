//
//  UIWindow+.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

public extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}
