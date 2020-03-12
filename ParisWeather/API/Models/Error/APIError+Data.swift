//
//  APIError+Data.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

extension APIError {
    
    /** The data associated with the error. */
    public struct Data: Decodable {
        
        /** The status code returned by API */
        public let status: Int
        
    }
}
