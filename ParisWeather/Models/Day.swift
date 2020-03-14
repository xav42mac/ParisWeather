//
//  Day.swift
//  ParisWeather
//
//  Created by Xav Mac on 13/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

// MARK: - Day
struct Day: Codable {
    let day: String
    let dt: Int
    var forecasts: [List]
    
    init(day: String, dt: Int) {
        self.day = day
        self.dt = dt
        self.forecasts = []
    }
}
