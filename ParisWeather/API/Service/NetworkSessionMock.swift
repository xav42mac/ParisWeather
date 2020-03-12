//
//  NetworkSessionMock.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

class NetworkSessionMock: NetworkSession {
    
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func performRequest(urlRequest: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completion(self.data,
                   self.response,
                   self.error)
    }
}
