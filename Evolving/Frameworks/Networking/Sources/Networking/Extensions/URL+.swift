//
//  URL+.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//

import Foundation

public extension URL {
    static var sampleData: URL {
        guard let url = Bundle.module.url(forResource: "sample", withExtension: "json") else {
            fatalError("Could not find sample data")
        }
        return url
    }

    var toData: Data {
        do {
            return try Data(contentsOf: self)
        } catch {
            debugPrint("Error Decoding: \(error.localizedDescription)")
            return Data()
        }
    }
}
