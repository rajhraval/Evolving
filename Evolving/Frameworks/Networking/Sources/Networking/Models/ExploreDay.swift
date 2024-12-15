//
//  ExploreDay.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//

import SwiftUI

public struct ExploreDay: Codable {
    public let id: Int
    public let title: String
    public let description: String
    public let numSteps: Int
    public let dayCompleted: String
    public let completedSteps: Int

    enum CodingKeys: String, CodingKey {
        case id, title, description
        case numSteps = "num_steps"
        case dayCompleted = "day_completed"
        case completedSteps = "completed_steps"
    }
}

