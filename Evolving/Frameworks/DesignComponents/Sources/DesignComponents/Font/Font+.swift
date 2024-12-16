//
//  Font+.swift
//
//
//  Created by Raj Raval on 10/05/24.
//

import SwiftUI

public extension Font {

    private static func customFont(with name: FontName = .lato, size: CGFloat, weight: FontWeight) -> Font {
        return .custom("\(name.name)-\(weight.name)", size: size)
    }

    private static func makeFont(design: Font.Design = .rounded, size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .system(size: size, weight: weight, design: design)
    }

    static var customNavigationTitle = customFont(with: .gothamRounded, size: .h4, weight: .medium)
    static var customTitle = customFont(with: .gothamRounded, size: .h5, weight: .medium)
    static var customHeadline = customFont(with: .gothamRounded, size: .pLarge, weight: .medium)
    static var customSubtitle = customFont(with: .lato, size: .p, weight: .regular)
    static var customCaption = customFont(with: .lato, size: .pSmall, weight: .regular)

}


extension UIFont {

    static func customFont(with name: FontName = .lato, size: CGFloat, weight: FontWeight) -> UIFont {
        if name == .lato {
            return UIFont(name: "\(name.name)-\(weight.name)", size: size) ?? .systemFont(ofSize: size)
        } else {
            return UIFont(name: "\(name.name)\(weight.name)", size: size) ?? .systemFont(ofSize: size)
        }
    }

    static var navigationTitle = customFont(with: .gothamRounded, size: .h4, weight: .bold)

}
