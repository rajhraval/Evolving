//
//  ExploreProblemType.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//

import SwiftUI

public struct ExploreProblemType: Codable, Identifiable, Equatable {
    public let id: Int
    public let title: String
}

public extension ExploreProblemType {
    static let all = ExploreProblemType(id: 0, title: "All")
    static let example = ExploreProblemType(id: 1, title: "💼 Work")
}
