//
//  API.swift
//  ParisWeather
//
//  Created by Xav Mac on 07/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import Foundation

public class API {
    static let shared = API()
    
    private var siteURL : String = ""
    private var route : String = ""
    private var consumerKey : String = ""
    private var consumerSecret : String = ""
    
    private let client : APIClient
    
    private let parisID : Int = 2968815
    
    private init() {
        
        if Bundle.main.bundleIdentifier?.contains(".dev") ?? false {
            // Dev Mode
            siteURL = "api.openweathermap.org"
            route = "/data/2.5"
            consumerKey = "1c8ad0324074b99148fedd75033828a2"
            consumerSecret = "" //Empty for trial version
            
        } else {
            // Prod Mode
            siteURL = "api.openweathermap.org"
            route = "/data/2.5"
            consumerKey = "650d394954a064cb446543f6e6439a4b"
            consumerSecret = "" //Empty for trial version
        }
        
        self.client = APIClient(session: Session(url: siteURL,
                                                 route: route,
                                                 key: consumerKey,
                                                 secret: consumerSecret))
    }
    
    //MARK: Forecast Call's
    func getForecastById(id: Int,
                         completion: @escaping (Result<Forecast>) -> Void) {
        client.getForecastById(withId: id,
                               apiKey: self.consumerKey,
                               completion: completion)
    }
}
