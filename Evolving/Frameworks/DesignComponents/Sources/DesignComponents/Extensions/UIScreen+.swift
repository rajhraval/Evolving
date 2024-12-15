//
//  UIScreen+.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

public extension UIScreen {
    static var current: UIScreen? {
        UIWindow.current?.screen
    }
}
