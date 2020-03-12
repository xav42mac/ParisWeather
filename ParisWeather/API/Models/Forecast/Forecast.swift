//
//  Forecast.swift
//  ParisWeather
//
//  Created by Xav Mac on 12/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

// MARK: - Forecast
struct Forecast: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}
