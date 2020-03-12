//
//  String+Extension.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

extension String {
    /**
     Returns a URL from the string. Can throw an `invalidUrl` exception if the string
     cannot be converted to a URL.
     */
    func asURL() throws -> URL {
        guard let url = URL(string: self) else {
            throw ServiceError.invalidUrl
        }
        return url
    }
}
