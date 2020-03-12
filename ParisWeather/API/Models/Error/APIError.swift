//
//  APIError.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

/** Represents an error from the API. */
public struct APIError: Decodable {
    
    init(code: String,
         message: String,
         data: Data? = nil) {
        self.code = code
        self.message = message
        self.data = data
    }
    
    /** The error code returned by API */
    public let code: String
    
    /** The error message returned by API */
    public let message: String
    
    /** The data associated with the error. */
    public let data: Data?
    
}
