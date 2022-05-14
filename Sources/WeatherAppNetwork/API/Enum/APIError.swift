//
//  APIError.swift
//  
//
//  Created by Burak Tunc on 14.05.22.
//

import Foundation

/// An enum represents some kind of errors that we can observe while communicating via HTTP
public enum APIError: LocalizedError {
    case encodingError
    case invalidURL
    case transportationError(requestURL: URL)
    case badRequest(requestURL: URL)
    case unauthorized(requestURL: URL)
    case tokenExpired(requestURL: URL)
    case notFound(requestURL: URL)
    case tooManyRequest(requestURL: URL)
    case internalServerError(requestURL: URL)
    case noData
    case decodingFailure
    case invalidResponse

    public var errorDescription: String? {
        switch self {
        case .encodingError: return "Encoding Error"
        case .invalidURL: return "Invalid URL"
        case .transportationError(requestURL: let URL): return "Transportation Error from URL: \(URL)"
        case .badRequest(requestURL: let URL): return "Bad Request Error from URL: \(URL)"
        case .unauthorized(requestURL: let URL): return "Unauthorized: \(URL)"
        case .tokenExpired(requestURL: let URL): return "Forbidden: \(URL)"
        case .notFound(requestURL: let URL): return "URL Not found: \(URL)"
        case .tooManyRequest(requestURL: let URL): return "Too Many Request Error from URL: \(URL)"
        case .internalServerError(requestURL: let URL): return "Internal Server Error from URL: \(URL)"
        case .noData: return "No Data"
        case .decodingFailure: return "Decoding Error"
        case .invalidResponse: return "Invalid Response"
        }
    }
}
