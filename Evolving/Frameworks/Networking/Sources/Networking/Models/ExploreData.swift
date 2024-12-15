//
//  ExploreResponse.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//


import SwiftUI

public struct ExploreData: Codable, Identifiable {
    public let id: Int
    public let title: String
    public let sessions: String
    public let mins: String
    public let thumbImage: String  

    public let promoText: String
    public let label: String
    public let description: String
    public let type: String
    public let premium: String
    public let numDays: Int
    public let coverImage: String
    public let link: String?
    public let problems: [String]
    public let techniques: [String]
    public let days: [ExploreDay]
    public let details: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, problems, techniques, days, details, sessions, mins
        case label = "ju_label"
        case promoText = "promo_text"
        case type = "ju_type"
        case premium = "ju_premium"
        case numDays = "num_days"
        case thumbImage = "thumb_image"
        case coverImage = "cover_image"
        case link = "ju_link"
    }

    public var isPremium: Bool {
        premium == "Premium"
    }

    public var thumbnailURL: URL {
        guard let thumbnailURL = URL(string: thumbImage) else {
            return URL(string: "")!
        }
        return thumbnailURL
    }
}

public extension ExploreData {

    static var mockData: ExploreData {
        ExploreData(
            id: 31,
            title: "Start loving your body more",
            sessions: "21 days",
            mins: "5-10 mins",
            thumbImage: "https://prod-assets.evolveinc.in/media/journey/thumb/20231208074415.webp",
            promoText: "21 days",
            label: "start-loving-your-body-more",
            description: "5-10 mins",
            type: "Single",
            premium: "Free",
            numDays: 1,
            coverImage: "https://prod-assets.evolveinc.in/media/journey/cover/20240422051829.webp",
            link: nil,
            problems: ["🌻 Self-love"],
            techniques: [],
            days: [],
            details: "v2"
        )
    }

}
