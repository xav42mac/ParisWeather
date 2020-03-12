//
//  Session.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

public class Session {
    
    /// The base URL, with the correct protocol (e.g. `https://www.example.com`).
    /// It should also avoid having a trailing slash.
    private let url: String
    
    private let route: String
    
    /// The consumer key, created on the API site.
    private let key: String
    
    /// The consumer secret, as created on the API site.
    private let secret: String
    
    var siteUrl: String {
        return self.url + self.route
    }
    
    /// The HTTP header, constructed from the consumer key and secret.
    var authorisationHeader: String {
        
        return HttpHeader.authorisation(username: self.key,
                                        password: self.secret)
    }
    
    public init(url: String,
                route: String,
                key: String,
                secret: String) {
        self.url = url
        self.route = route
        self.key = key
        self.secret = secret
    }
    
}
