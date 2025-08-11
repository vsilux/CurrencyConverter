//
//  FastforexRepository.swift
//  CurrencyConverter
//
//  Created by Illia Suvorov on 11.08.2025.
//

import Foundation
import Combine

protocol FastforexRepositoryContract {
}

class FastforexRepository {
    static let baseUrl = "https://api.fastforex.io"
    let apiKey: String = "b03886be68-4980c54f42-t0sct4"
    let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchOne(from: String, to: String) async throws -> RatesResponse {
        let request = try OneRateEndpoint.rate(from: from, to: to)
            .request(baseUrl: Self.baseUrl, apiKey: apiKey)
        
        return try OneRateResultMapper.map(try await urlSession.data(for: request))
    }

}
