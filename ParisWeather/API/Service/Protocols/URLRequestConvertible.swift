//
//  URLRequestConvertible.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
    /// Returns a `URLRequest` or throws if an `Error` was encoutered.
    ///
    /// - Returns: A `URLRequest`.
    /// - Throws: Any error thrown while constructing the `URLRequest`.
    func asURLRequest(session: Session) throws -> URLRequest
}
