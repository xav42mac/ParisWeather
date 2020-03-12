//
//  Error+Extension.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

extension Error {
    
    var asServiceError: ServiceError? {
        return self as? ServiceError
    }
}
