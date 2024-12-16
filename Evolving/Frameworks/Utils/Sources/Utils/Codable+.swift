//
//  Codable+.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//

import Foundation

public extension Encodable {
    var codableData: Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            debugPrint("Error Decoding: \(error.localizedDescription)")
            return nil
        }
    }
}

public extension Decodable {
    static func fromData<T: Decodable>(_ data: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            return nil
        }
    }
}
