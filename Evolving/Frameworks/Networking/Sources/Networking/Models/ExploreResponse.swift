//
//  ExploreResponse.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//


import SwiftUI

public struct ExploreResponse: Codable {
    public let metadata: ExploreMetadata
    public let data: [ExploreData]
    public let problemFilters: [ExploreProblemType]

    enum CodingKeys: String, CodingKey {
        case metadata, data
        case problemFilters = "problem_filter"
    }
}
