//
//  ExploreMetadata.swift
//  Networking
//
//  Created by Raj Raval on 16/12/24.
//

import Foundation

public struct ExploreMetadata: Codable {
    public let status: Bool
    public let totalPages: Int
    public let premiumStatus: Int

    enum CodingKeys: String, CodingKey {
        case status
        case totalPages = "total_pages"
        case premiumStatus = "premium_status"
    }
}
