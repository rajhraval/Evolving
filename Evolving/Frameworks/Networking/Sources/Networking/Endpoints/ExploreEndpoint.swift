//
//  ExploreEndpoint.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//

import Foundation

enum ExploreEndpoint: Endpoint {
    case explore

    var baseURL: URL {
        return URL(string: "")!
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
        return nil
    }

    var method: HTTPRequestMethod {
        return .get
    }

    var body: Data? {
        return nil
    }
}
