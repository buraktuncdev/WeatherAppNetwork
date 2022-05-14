//
//  APIEnvironment.swift
//  
//
//  Created by Burak Tunc on 14.05.22.
//

import Foundation

/// Reusable and expandable domain specific environment configuration enum
public enum APIEnvironment {
    case development
    case integration
    case stress
    case production

    /// Creating a string of the base URL to make network request
    /// - Returns: Value of base URL as String
    public func getBaseURLString() -> String {
        return "\(APIConstants.APIScheme)\(getSubDomain()).\(getDomain())"
    }

    /// This function helps creating environment specific domain string
    /// - Returns: Value of the domain as String
    public func getDomain() -> String {
        switch self {
        case .development:
            return APIConstants.APIDomain
        case .integration:
            return APIConstants.APIDomain
        case .stress:
            return APIConstants.APIDomain
        case .production:
            return APIConstants.APIDomain
        }
    }

    // This function helps creating environment specific sub domain information as string
    /// - Returns: Value of the subdomain as String
    public func getSubDomain() -> String {
        switch self {
        case .development, .integration, .stress, .production:
            return APIConstants.APISubDomain
        }
    }
}
