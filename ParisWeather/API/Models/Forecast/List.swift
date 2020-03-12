//
//  List.swift
//  ParisWeather
//
//  Created by Xav Mac on 12/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainDetails
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let sys: Sys
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, sys
        case dtTxt = "dt_txt"
        case rain
    }
}
