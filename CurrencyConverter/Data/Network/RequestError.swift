//
//  RequestError.swift
//  CurrencyConverter
//
//  Created by Illia Suvorov on 11.08.2025.
//

import Foundation

struct RequestError: LocalizedError, Decodable {
    let error: String
    let code: String?
    
    var errorDescription: String? {
#if DEBUG
        return "Error code: \(code ?? ""), message: \(error)"
#else
        return error
#endif
    }
}
