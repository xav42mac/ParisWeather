//
//  APIConfiguration.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

protocol APIConfiguration: URLRequestConvertible {
    associatedtype T: Encodable
    var method: HttpMethod { get }
    var path: String { get }
    var parameters: T? { get }
}

extension APIConfiguration {
    func asURLRequest(session: Session) throws -> URLRequest {
        let url = try session.siteUrl.asURL()
        var urlRequest = URLRequest(url: try url.appendingPathComponent(self.path).absoluteString.removingPercentEncoding?.asURL() ?? url.appendingPathComponent(self.path))
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.allHTTPHeaderFields = self.httpHeaders(with: session)
        if let parameters = self.parameters {
            do {
                if let params : String = parameters as? String {
                    urlRequest.httpBody = params.data(using:String.Encoding.ascii, allowLossyConversion: false)
                } else {
                    urlRequest.httpBody = try JSONEncoder().encode(parameters)
                }
            } catch {
                throw ServiceError.parameterEncodingFailed
            }
        }
        return urlRequest
    }
    
    func httpHeaders(with session: Session) -> [String: String] {
        return ["Authorization": session.authorisationHeader,
                "Accept": "application/json",
                "Content-Type": "application/json"]
    }
}
