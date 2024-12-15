//
//  API+.swift
//
//
//  Created by Raj Raval on 09/05/24.
//

import Foundation
import UIKit.UIImage

public extension API {

    func request<T: Codable>(_ endpoint: Endpoint) async throws -> T {
        let pathURL = endpoint.baseURL.appendingPathComponent(endpoint.path)

        guard var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: false) else {
            throw APIError.invalidURLError
        }

        if let queryItems = endpoint.queryItems, !queryItems.isEmpty {
            urlComponents.queryItems = queryItems
        }

        guard let url = urlComponents.url else {
            throw APIError.invalidURLError
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        if endpoint.method == .post {
            request.httpBody = endpoint.body
        }

        NetworkLogger.logNetworkRequest(for: url, endpoint: endpoint)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw APIError.networkingError(error: NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: nil))
            }

            NetworkLogger.logNetworkResponse(for: httpResponse, data: data)

            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch let error as URLError where error.code == .notConnectedToInternet || error.code == .networkConnectionLost {
            throw APIError.internetError
        } catch let error as URLError where error.code == .cannotDecodeRawData {
            throw APIError.decodingError(error: error)
        } catch let error {
            throw APIError.unknownError(error: error)
        }
    }

    func requestImage(from url: URL) async throws -> UIImage? {
        NetworkLogger.logNetworkRequest(for: url)
        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.networkingError(error: NSError(domain: "HTTP Error", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: nil))
            }
            NetworkLogger.logNetworkResponse(for: httpResponse, data: data)
            return UIImage(data: data)
        } catch let error as URLError where error.code == .notConnectedToInternet || error.code == .networkConnectionLost {
            throw APIError.internetError
        } catch let error as URLError where error.code == .cannotDecodeRawData {
            throw APIError.decodingError(error: error)
        } catch let error {
            throw APIError.unknownError(error: error)
        }
    }

}
