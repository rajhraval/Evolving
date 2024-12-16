//
//  ExploreEndpoint.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//

import Foundation

enum ExploreEndpoint: Endpoint {
    case explore(page: Int, limit: Int)

    var baseURL: URL {
        return URL(string: "http://localhost:3000/api")!
    }

    var path: String {
        switch self {
        case .explore:
            return "/explore"
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .explore(let page, let limit):
            return [
                URLQueryItem(name: "_page", value: "\(page)"),
                URLQueryItem(name: "_limit", value: "\(limit)")
            ]
        }
    }

    var method: HTTPRequestMethod {
        return .get
    }

    var body: Data? {
        return nil
    }
}
