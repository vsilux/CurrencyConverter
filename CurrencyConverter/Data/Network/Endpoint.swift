//
//  Endpoint.swift
//  CurrencyConverter
//
//  Created by Illia Suvorov on 10.08.2025.
//

import Foundation

protocol Endpoint {
    static var subpath: String { get }
    func request(baseUrl: String, apiKey: String) throws -> URLRequest
}
