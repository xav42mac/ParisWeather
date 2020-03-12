//
//  StreamResult.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

/**
 Quite a self explanatory enum which can be either `success` or `failure`,
 depending on the response from the service.
 */
public enum Result<Value> {
    /** The request was successful and the response was received and understood. */
    case success(Value)
    /** The request was made but an error was encountered during the response. */
    case failure(Error)
    
    var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    var isFailure: Bool {
        return !self.isSuccess
    }
    
    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
    
}
