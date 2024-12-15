//
//  DesignConstants.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import SwiftUI

// MARK: Spacing and Padding
public extension CGFloat {
    /// Default Corner Radius is set to 14
    static let cornerRadius: CGFloat = 14
    /// Mini, 4
    static let mini: CGFloat = 4
    /// Small, 8
    static let small: CGFloat = 8
    /// Regular, 12
    static let regular: CGFloat = 12
    /// Regular 2, 16
    static let regular2: CGFloat = 16
    /// Regular 3, 20
    static let regular3: CGFloat = 20
    /// Medium, 24
    static let medium: CGFloat = 24
    /// Large, 36
    static let large: CGFloat = 36
    /// Extra Large, 48
    static let extraLarge: CGFloat = 48
    /// Extra Large 2, 64
    static let extraLarge2: CGFloat = 64
    /// Super Large, 72
    static let superLarge: CGFloat = 72
}

// MARK: Sizes
public extension CGSize {
    /// Mini, 4
    static let mini: CGSize = CGSize(width: .mini, height: .mini)
    /// Small, 8
    static let small: CGSize = CGSize(width: .small, height: .small)
    /// Regular, 12
    static let regular: CGSize = CGSize(width: .regular, height: .regular)
    /// Regular 2, 16
    static let regular2: CGSize = CGSize(width: .regular2, height: .regular2)
    /// Regular 3, 20
    static let regular3: CGSize = CGSize(width: .regular3, height: .regular3)
    /// Medium, 24
    static let medium: CGSize = CGSize(width: .medium, height: .medium)
    /// Large, 36
    static let large: CGSize = CGSize(width: .large, height: .large)
    /// Extra Large, 48
    static let extraLarge: CGSize = CGSize(width: .extraLarge, height: .extraLarge)
    /// Extra Large 2, 64
    static let extraLarge2: CGSize = CGSize(width: .extraLarge2, height: .extraLarge2)
    /// Super Large, 72
    static let superLarge: CGSize = CGSize(width: .superLarge, height: .superLarge)
}

// MARK: Screen Dimesions
public extension CGFloat {
    /// Gives the full height of the screen
    static let screenHeight: CGFloat = UIScreen.current?.bounds.height ?? UIScreen.main.bounds.height
    /// Gives the full width of the screen
    static let screenWidth: CGFloat = UIScreen.current?.bounds.width ?? UIScreen.main.bounds.width
    /// Half the height of the screen
    static let halfScreenHeight: CGFloat = screenHeight / 2
    /// Half the width of the screen
    static let halfScreenWidth: CGFloat = screenWidth / 2
}

// MARK: Font Sizes
public extension CGFloat {
    /// h0, 64
    static let h0: CGFloat = 64
    /// h1, 56
    static let h1: CGFloat = 56
    /// h2, 48
    static let h2: CGFloat = 48
    /// h3, 36
    static let h3: CGFloat = 36
    /// h4, 28
    static let h4: CGFloat = 28
    /// h5, 24
    static let h5: CGFloat = 24
    /// h6, 20
    static let h6: CGFloat = 20
    /// pLarge, 18
    static let pLarge: CGFloat = 18
    /// p, 16
    static let p: CGFloat = 16
    /// pSmall, 14
    static let pSmall: CGFloat = 14
    /// pSmall, 12
    static let pTiny: CGFloat = 12
}
