//
//  APIConsumer.swift
//  
//
//  Created by Burak Tunc on 14.05.22.
//

import Foundation

/// A network manager class that provides communication between application and server
public final class APIManager {

    /// Generic Network Request function
    /// - Parameters:
    ///   - urlRequest: It represents information about the network request. Should be passed from service layer of the application
    ///   - requestBody: This parameter provides creating request body if needed
    ///   - httpHeaders: Any specific HTTP headers can be set from service layer of the application
    ///   - completion: Completion handler to get response from the API. Result type can be a data model or APIError
    func callAPI<T: Codable>(urlRequest: URLRequest,
                             requestBody: Data?,
                             httpHeaders: [String:Any]?,
                             completion: @escaping (Result<T, APIError>) -> Void) {

        let session = URLSession(configuration: .default)

        session.dataTask(with: urlRequest) { data, response, error in

            guard let requestURL = urlRequest.url else {
                completion(.failure(.invalidURL))
                return
            }

            guard let _ = error else {
                completion(.failure(.transportationError(requestURL: requestURL)))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }

            if httpResponse.statusCode == 400 {
                completion(.failure(.badRequest(requestURL: requestURL)))
            }

            if httpResponse.statusCode == 401 {
                completion(.failure(.unauthorized(requestURL: requestURL)))
            }

            if httpResponse.statusCode == 403 {
                completion(.failure(.tokenExpired(requestURL: requestURL)))
            }

            if httpResponse.statusCode == 404 {
                completion(.failure(.notFound(requestURL: requestURL)))
            }

            if httpResponse.statusCode == 429 {
                completion(.failure(.tooManyRequest(requestURL: requestURL)))
            }

            if httpResponse.statusCode == 500 {
                completion(.failure(.internalServerError(requestURL: requestURL)))
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(responseObject))
            } catch {
                completion(.failure(.decodingFailure))
            }
        }.resume()
    }
    
}
