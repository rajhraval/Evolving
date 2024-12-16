//
//  ExploreEndpoint.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//

import Foundation

enum ExploreEndpoint: Endpoint {
    case explore(page: Int, limit: Int, keyword: String?, problems: [String]?)

    var baseURL: URL {
        return URL(string: "http://localhost:3000")!
    }

    var path: String {
        switch self {
        case .explore:
            return "/api/problems"
        }
    }

    var headers: [String: String]? {
        return nil
    }

    var queryItems: [URLQueryItem]? {
        switch self {
        case .explore(let page, let limit, let keyword, let problems):
            var items = [
                URLQueryItem(name: "_page", value: "\(page)"),
                URLQueryItem(name: "_limit", value: "\(limit)")
            ]
            if let keyword = keyword, !keyword.isEmpty {
                items.append(URLQueryItem(name: "q", value: keyword))
            }
            if let problems = problems, !problems.isEmpty {
                problems.forEach { problem in
                    items.append(URLQueryItem(name: "problems", value: problem))
                }
            }
            return items
        }
    }

    var method: HTTPRequestMethod {
        return .get
    }

    var body: Data? {
        return nil
    }
}
