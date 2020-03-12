//
//  URLSession+Extension.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

extension URLSession: NetworkSession {
    
    func performRequest(urlRequest: URLRequest,
                        completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let method = urlRequest.httpMethod ?? "undisclosed method"
        print("ℹ️ Request made to URL: \(urlRequest) (\(method)) ℹ️")
        let task = dataTask(with: urlRequest) { data, response, error in
            completion(data, response, error)
        }
        task.resume()
    }
    
}
