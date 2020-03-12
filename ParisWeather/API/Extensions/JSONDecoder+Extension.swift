//
//  JSONDecoder+Extension.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static var ISO8601JSONDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.apiDateFormatter)
        return decoder
    }
}
