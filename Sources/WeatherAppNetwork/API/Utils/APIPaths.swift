//
//  APIPaths.swift
//  
//
//  Created by Burak Tunc on 14.05.22.
//

import Foundation

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

public let baseURLString = environment.getBaseURLString()

/// This class provides creating our specific URLs as string to make the network request
public class APIPaths {

    /// Creating forecast URL to make network request and get the data from API
    /// - Parameters:
    ///   - apiKey: specific api key for unique customers of the API
    ///   - latitude: a geographic coordinate that specifies a degree measured north and south from Equator
    ///   - longitude: a geographic coordinate that specifies ia degree measured east and west fromfrom the great circle passing through Greenwich
    /// - Returns: A String value of the forecast url
    public func createForecastURL(apiKey: String, latitude: Double, longitude: Double) -> String {
        return "\(baseURLString)/\(APIConstants.forecastPath)/\(apiKey)/\(latitude),\(longitude)"
    }
}
