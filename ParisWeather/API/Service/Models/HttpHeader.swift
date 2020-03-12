//
//  HttpHeader.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

/**
 A representation of a single HTTP header's name / value pair.
 */
struct HttpHeader {
    /**
     Returns a `Basic` `Authorisation` header using the `username` and `password` provided.
     */
    static func authorisation(username: String,
                              password: String) -> String {
        let credential = Data("\(username):\(password)".utf8).base64EncodedString()
        return "Basic \(credential)"
    }
}
