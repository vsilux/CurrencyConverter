//
//  FetchOneRate.swift
//  CurrencyConverter
//
//  Created by Illia Suvorov on 10.08.2025.
//

import Foundation

enum OneRateEndpoint: Endpoint {
    case rate(from: String, to: String)
    
    static let subpath: String = "fetch-one"
    
    func request(baseUrl: String, apiKey: String) throws -> URLRequest {
        guard let url = URL(string: "\(baseUrl)/\(Self.subpath)") else {
            throw URLError(.badURL)
        }
        
        var components = {
            var components = URLComponents(
                url: url,
                resolvingAgainstBaseURL: false
            )!
            switch self {
            case let .rate(from, to):
                components.queryItems = [
                    URLQueryItem(name: "from", value: from),
                    URLQueryItem(name: "to", value: to),
                ]
            }
            
            return components
        }()
        
        components.queryItems?.append(URLQueryItem(name: "api_key", value: apiKey))
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        return request
    }
}

enum OneRateResultMapper {
    static func map(_ response: (data: Data, response: URLResponse)) throws -> RatesResponse {
        let data = response.data
        guard let response = response.response as? HTTPURLResponse else {
            throw RequestError(
                error: "Invalid response",
                code: "INVALID_RESPONSE"
            )
        }
        
        let decoder = JSONDecoder()

        guard response.statusCode == 200 else {
            throw try decoder.decode(RequestError.self, from: data)
        }
        
        return try decoder.decode(RatesResponse.self, from: data)
    }
}
