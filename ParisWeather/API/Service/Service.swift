//
//  StreamService.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

class Service {
    
    private let networkSession: NetworkSession
    private let appSession: Session
    
    init(urlSession: NetworkSession = URLSession.shared,
         appSession: Session) {
        self.networkSession = urlSession
        self.appSession = appSession
    }
    
    func performRequest<T: APIConfiguration>(route: T,
                                             completion: @escaping (Result<Data>) -> Void) {
        do {
            networkSession.performRequest(urlRequest: try route.asURLRequest(session: self.appSession)) { data, response, error in
                //Check for errors.
                if let error = error {
                    completion(Result.failure(error))
                    return
                }
                //Cast response
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(Result.failure(ServiceError.uninterpretableResponse))
                    return
                }
                //Check response status code.
                guard 200...299 ~= httpResponse.statusCode else {
                    print("===== Status Code --> \(httpResponse.statusCode) =====")
                    completion(Result.failure(ServiceError.unacceptableResponseCode))
                    return
                }
                //Check MIME type
                if httpResponse.mimeType != "application/json" {
                    completion(Result.failure(ServiceError.incorrectMimeType))
                    return
                }
                //Check for data received.
                guard let data = data else {
                    completion(Result.failure(ServiceError.noDataReceived))
                    return
                }
                completion(Result.success(data))
            }
        } catch {
            completion(Result.failure(error))
        }
    }
    
}
