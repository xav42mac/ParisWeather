//
//  NetworkSession.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

protocol NetworkSession {
    func performRequest(urlRequest: URLRequest,
                        completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
