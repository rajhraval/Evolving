//
//  Font+.swift
//
//
//  Created by Raj Raval on 10/05/24.
//

import SwiftUI

public extension Font {

    private static func customFont(with name: FontName = .plusJakartaSans, size: CGFloat, weight: FontWeight) -> Font {
        return .custom("\(name.name)\(weight.name)", size: size)
    }

    private static func makeFont(design: Font.Design = .rounded, size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .system(size: size, weight: weight, design: design)
    }

    /// 64, Bold
    static let h0 = makeFont(size: .h0, weight: .bold)
    /// 56, Bold
    static let h1 = makeFont(size: .h1, weight: .bold)
    /// 48, Bold
    static let h2 = makeFont(size: .h2, weight: .bold)
    /// 36, Bold
    static let h3 = makeFont(size: .h3, weight: .bold)
    /// 28, Semibold
    static let h4 = makeFont(size: .h4, weight: .semibold)
    /// 24, Semibold
    static let h5 = makeFont(size: .h5, weight: .semibold)
    /// 20, Semibold
    static let h6 = makeFont(size: .h6, weight: .semibold)
    /// 18, Medium / Semibold
    static func pLarge(isBold: Bool = false) -> Font { makeFont(size: .pLarge, weight: isBold ? .semibold : .medium) }
    /// 16, Regular / Semibold
    static func p(isBold: Bool = false) -> Font { makeFont(size: .p, weight: isBold ? .semibold : .regular) }
    /// 14, Regular / Semibold
    static func pSmall(isBold: Bool = false) -> Font { makeFont(size: .pSmall, weight: isBold ? .semibold : .regular) }
    /// 12, Medium / Regular
    static func pTiny(isBold: Bool = false) -> Font { makeFont(size: .pTiny, weight: isBold ? .medium : .regular) }
}
