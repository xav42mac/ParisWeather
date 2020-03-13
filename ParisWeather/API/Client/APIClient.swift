//
//  APIClient.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

public class APIClient {
    
    private let session: Session
    
    public init(session: Session) {
        self.session = session
    }
    
    /**
     Performs a network request using the provided parameters. Returns the result as part of the completion handler. This function also returns the decoded object as part of the response.
     - parameter route: The router being used for the request.
     - parameter decoder: A JSONDecoder object which can be overriden if required. Defaults to an ISO8601 Date Decoder which is suitable for the majority of response from API.
     - parameter completion: The completion handler used when the request is successful or encounters an error.
     */
    func performRequest<T: Decodable, R: APIConfiguration>(route: R,
                                                           decoder: JSONDecoder = JSONDecoder(),
                                                           completion: @escaping (Result<T>) -> Void) {
        Service(appSession: self.session).performRequest(route: route) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedResult = try decoder.decode(T.self, from: data)
                    self.printSuccess()
                    completion(Result.success(decodedResult))
                } catch {
                    let error = ServiceError.decodeFailed
                    self.printError(error)
                    completion(Result.failure(error))
                }
            case .failure(let error):
                self.printError(error)
                completion(Result.failure(error))
            }
        }
    }
    
    /**
     Prints success information to the logs.
     While this may seem over the top, it's handy when debugging.
     */
    private func printSuccess() {
        print("✅ Response received and decoded. ✅")
    }
    
    /**
     Prints the supplied error to the logs, if not nil.
     - parameter error: The error as returned by the service.
     */
    private func printError(_ error: Error?) {
        guard let error = error else { return }
        print("⚠️ API encountered an exception: \(error.localizedDescription) ⚠️")
    }
    
    /**
     Attempts to decode the error into the APIError model.
     - parameter error: The error, in Data format.
     - returns: An optional APIError object detailing the error.
     */
    private func decodeError(_ error: Data?) -> APIError? {
        guard let error = error else { return nil }
        do {
            return try JSONDecoder().decode(APIError.self, from: error)
        } catch {
            return nil
        }
    }
    
    private var genericAPIError: APIError {
        return APIError(code: "api_unknown_error",
                        message: "Sorry, an unexpected error was encountered. Please try your request again.")
    }
    
}

extension APIClient: APIClientProtocol {
    
    //MARK: Forecast
    func getForecastById(withId id: Int,
                         apiKey: String,
                         completion: @escaping (Result<Forecast>) -> Void) {
        self.performRequest(route: ForecastEndpoint.getForId(id, apiKey),
                            completion: completion)
    }
}
