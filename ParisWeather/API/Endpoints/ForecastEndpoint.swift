//
//  ForecastEndpoint.swift
//  ParisWeather
//
//  Created by Xav Mac on 06/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

enum ForecastEndpoint: APIConfiguration {
    
    /** Gets a specific forecast from the Openweather API. */
    case getForId(_ id: Int, _ apiKey: String)
    
    var method: HttpMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .getForId(let id, let apiKey):
            return "/forecast?id=\(id)&APPID=\(apiKey)"
        }
    }
    
    var parameters: String? {
        switch self {
        case .getForId:
            return nil
        }
    }
}
