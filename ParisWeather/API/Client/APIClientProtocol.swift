//
//  APIClientProtocol.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

protocol APIClientProtocol {
    /**
     Retrieves a forecast
     - parameter id: ID of the city. (Check the city list delivered by Open Weather)
     - parameter apiKey: API Key delivered by OpenWeather.
     - parameter completion: The completion handler used when the request is successful or encounters an error.
     */
    func getForecastById(withId id: Int,
                         apiKey: String,
                         completion: @escaping (Result<Forecast>) -> Void)
}
