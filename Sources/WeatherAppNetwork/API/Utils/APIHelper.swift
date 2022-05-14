//
//  APIHelper.swift
//  
//
//  Created by Burak Tunc on 14.05.22.
//

import Foundation

/// A class to set HTTP URL configurations that we need for our application
public struct APIHelper {

    /// This function provides setting query parameters whenever its needed
    /// - Parameters:
    ///   - parameters: query parameters are a defined set of parameters attached to the end of a URL. They help define specific content or actions based on the data being passed.
    ///   - url: Request URL
    /// - Returns: URLComponents is a structure that parses and constructs URLs according to RFC 3986
    func setQueryParameters(parameters: [String:Any], url: URL) -> URLComponents {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = parameters.map({ queryItem in
            URLQueryItem(name: queryItem.key, value: queryItem.value as? String)
        })
        return urlComponents ?? URLComponents()
    }


    /// This function provides creating and setting HTTP request headers whichever needed
    /// - Parameters:
    ///   - request: A URL load request that is independent of protocol or URL scheme.
    ///   - headers: A dictionary to set key value pairs of HTTP headers
    /// - Returns: A URL load request that is independent of protocol or URL scheme.
    func setRequestHeaders(request: inout URLRequest, headers:[String:String]) -> URLRequest {
        headers.forEach { header in
            request.setValue(header.key, forHTTPHeaderField: header.value)
        }
        return request
    }


    /// This function provides determining the request HTTP method
    /// - Parameters:
    ///   - request: A URL load request that is independent of protocol or URL scheme.
    ///   - httpMethod: HTTPMethod enum type
    /// - Returns: A URL load request that is independent of protocol or URL scheme.
    func setRequestHttpMethod(request: inout URLRequest, httpMethod: HTTPMethod) -> URLRequest {
        request.httpMethod = httpMethod.rawValue
        return request
    }
    
}
