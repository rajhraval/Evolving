//
//  API.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import Foundation
import UIKit.UIImage

public protocol API {
    func requestImage(from url: URL) async throws -> UIImage?
    func request<T: Codable>(_ endpoint: Endpoint) async throws -> T
}
