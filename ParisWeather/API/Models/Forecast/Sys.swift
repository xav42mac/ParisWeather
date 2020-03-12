//
//  Sys.swift
//  ParisWeather
//
//  Created by Xav Mac on 12/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}
