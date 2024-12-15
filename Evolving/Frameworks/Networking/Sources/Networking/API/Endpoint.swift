//
//  Endpoint.swift
//  
//
//  Created by Raj Raval on 09/05/24.
//

import Foundation

public protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var method: HTTPRequestMethod { get }
    var body: Data? { get }
    var queryItems: [URLQueryItem]? { get }
}
