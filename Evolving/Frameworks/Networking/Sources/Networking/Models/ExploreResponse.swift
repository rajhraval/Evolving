//
//  ExploreResponse.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//


import SwiftUI

public struct ExploreResponse: Codable {
    public let status: Bool
    public let data: [ExploreData]
    public let totalPages: Int
    public let premiumStatus: Int
    public let problemFilters: [ExploreProblemType]

    enum CodingKeys: String, CodingKey {
        case status, data
        case totalPages = "total_pages"
        case premiumStatus = "premium_status"
        case problemFilters = "problem_filter"
    }
}
