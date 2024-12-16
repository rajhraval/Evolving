//
//  FontHelper.swift
//
//
//  Created by Raj Raval on 10/05/24.
//

import Foundation

enum FontName: String {
    case lato
    case gothamRounded

    var name: String {
        rawValue.capitalized
    }
}

enum FontWeight: String {
    case regular
    case medium
    case book
    case bold

    var name: String {
        rawValue.capitalized
    }
}
