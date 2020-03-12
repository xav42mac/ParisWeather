//
//  ServiceError.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

enum ServiceError: LocalizedError {
    /** Returned when the URL cannot be built.*/
    case invalidUrl
    /** Returned when the server returns something other than `application/json` */
    case incorrectMimeType
    /** Returned when the server didn't repond with a 2xx response, usually meaning
        that the request failed. */
    case unacceptableResponseCode
    /** Returned when there is no error received but there is also no data. */
    case noDataReceived
    /** Returned when the response cannot be cast to a HTTPURLResponse. */
    case uninterpretableResponse
    /** Returned when encoding the parameters failed. */
    case parameterEncodingFailed
    /** Returned when a response is received, but is not able to be decoded. */
    case decodeFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The URL couldn't be built."
        case .incorrectMimeType:
            return "The server didn't return JSON formatted data."
        case .unacceptableResponseCode:
            return "The server returned an unacceptable response code."
        case .noDataReceived:
            return "To data received."
        case .uninterpretableResponse:
            return "Unable to interpret response."
        case .parameterEncodingFailed:
            return "Parameter encoding failed."
        case .decodeFailed:
            return "Unable to decode the response."
        }
    }
    
}

// MARK: - Error Booleans

extension ServiceError {
    
    var isInvalidURL: Bool {
        if case .invalidUrl = self { return true }
        return false
    }
    
    var isIncorrectMimeType: Bool {
        if case .incorrectMimeType = self { return true }
        return false
    }
    
    var isUnacceptableResponseCode: Bool {
        if case .unacceptableResponseCode = self { return true }
        return false
    }
    
    var isNoDataReceived: Bool {
        if case .noDataReceived = self { return true }
        return false
    }
    
    var isUninterpretableResponse: Bool {
        if case .uninterpretableResponse = self { return true }
        return false
    }
    
    var isParameterEncodingFailed: Bool {
        if case .parameterEncodingFailed = self { return true }
        return false
    }
    
    var isDecodeFailed: Bool {
        if case .decodeFailed = self { return true }
        return false
    }
    
}
