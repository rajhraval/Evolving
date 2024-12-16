//
//  APIError.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import Foundation

public enum APIError: Error {
    case invalidURLError
    case networkingError(error: Error)
    case decodingError(error: Error)
    case internetError
    case unknownError(error: Error)

    public var title: String {
        switch self {
        case .internetError:
            return "Connection Failed"
        default:
            return "Something's Wrong"
        }
    }

    public var description: String {
        switch self {
        case .internetError:
            return "Check your connection."
        default:
            return "Try again later."
        }
    }

    var image: String {
        switch self {
        case .internetError:
            return "wifi.slash"
        default:
            return "pc"
        }
    }
}
