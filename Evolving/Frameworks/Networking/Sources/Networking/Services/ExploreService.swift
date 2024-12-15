//
//  ExploreService.swift
//  Networking
//
//  Created by Raj Raval on 15/12/24.
//

import SwiftUI

public class ExploreService: API {

    public func fetchExploreData() async throws -> ExploreResponse {
        try await request(ExploreEndpoint.explore)
    }

}

public class MockExploreService {

    public init() {}    

    public func fetchExploreData() -> ExploreResponse {
        let url = URL.sampleData
        let data = url.toData
        guard let response: ExploreResponse = ExploreResponse.fromData(data) else {
            fatalError("Couldn't decode Mock ExploreResponse")
        }
        return response
    }

}
