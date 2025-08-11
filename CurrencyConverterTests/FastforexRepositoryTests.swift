//
//  FastforexRepositoryTests.swift
//  CurrencyConverterTests
//
//  Created by Illia Suvorov on 11.08.2025.
//

import XCTest
import Combine
@testable import CurrencyConverter

final class FastforexRepositoryTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []
    
    func testFetchOneRate() async throws {
        let data = """
            {
              "base": "USD",
              "result": {
                "EUR": 0.86064
              },
              "updated": "2025-08-11 13:23:24",
              "ms": 6
            }
            """.data(using: .utf8)!
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: URL(
                    string: FastforexRepository.baseUrl + "/fetch-one"
                )!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: ["Content-Type": "application/json"]
            )!
            return (response, data)
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        
        let repository = FastforexRepository(urlSession: session)
        
        do {
            let _ = try await repository.fetchOne(from: "USD", to: "EUR")
        } catch {
            XCTFail("Expected success but got error: \(error)")
        }
    }
}

