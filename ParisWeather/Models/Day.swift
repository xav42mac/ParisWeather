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
    var forecasts: [List]
    
    init(day: String) {
        self.day = day
        self.forecasts = []
    }
}
