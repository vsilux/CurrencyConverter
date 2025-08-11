//
//  RatesResponse.swift
//  CurrencyConverter
//
//  Created by Illia Suvorov on 10.08.2025.
//

import Foundation

struct RatesResponse: Codable {
    let base: String
    let result: [String: Decimal]
}
