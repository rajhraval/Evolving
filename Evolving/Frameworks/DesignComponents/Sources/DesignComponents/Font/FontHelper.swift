//
//  FontHelper.swift
//
//
//  Created by Raj Raval on 10/05/24.
//

import Foundation

public enum FontName: String {
    case plusJakartaSans

    var name: String {
        rawValue.capitalized
    }
}

public enum FontWeight: String {
    case regular
    
    var name: String {
        rawValue.capitalized
    }
}
