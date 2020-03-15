//
//  HomeViewController+Extension.swift
//  ParisWeather
//
//  Created by Xav Mac on 13/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - HomeViewController -> Functions
extension HomeViewController {
    
    // MARK: - Get forecasts from API
    func getForecasts() {
        API.shared.getForecastById(id: cityID) { (result) in
            
            if result.isSuccess {
                if let forecast = result.value {
                    
                    // save lastest fetched forecast
                    UserDefaults.standard.set(try? PropertyListEncoder().encode(forecast),
                    forKey:"Forecast")
                    
                    self.cityForecast = forecast
                    self.cityForecastPerDay = self.parseForecastListPerDay(list: forecast.list)
                    self.actualizeDataOnScreen(forecast: forecast)
                    return
                }
            }
            
            // if it can't retrieve data from the API at launch, we show the lastest fetched forecast
            if self.cityForecast == nil {
                if let data = UserDefaults.standard.value(forKey:"Forecast") as? Data {
                    if let lastForecastFetched = try? PropertyListDecoder().decode(Forecast.self, from: data) {
                        self.cityForecast = lastForecastFetched
                        self.cityForecastPerDay = self.parseForecastListPerDay(list: lastForecastFetched.list)
                        self.actualizeDataOnScreen(forecast: lastForecastFetched)
                        return
                    }
                }
            }
            
            self.showErrorWithRetry(message: result.error?.localizedDescription ?? "Unknown Error")
        }
    }
    
    // MARK: - Actualize screen data on the main thread
    func actualizeDataOnScreen(forecast: Forecast) {
        
        DispatchQueue.main.async {
            self.cityLabel.text = forecast.city.name
            self.citySunriseLabel.text = self.createDateTime(timestamp: forecast.city.sunrise, format: "HH:mm:ss")
            self.citySunsetLabel.text = self.createDateTime(timestamp: forecast.city.sunset, format: "HH:mm:ss")
            self.dayForecastCollectionView.reloadData()
            self.dayPageControl.numberOfPages = self.cityForecastPerDay.count
        }
    }
    
    // MARK: - Parse per day a list of forecast
    func parseForecastListPerDay(list: [List]) -> [Day] {
        
        var parsedPerDay : [Day] = []
        var actualDay : Day? = nil
        var date : String = ""
        
        for forecast in list {
            
            let forecastDay = forecast.dtTxt.split(separator: " ")[0]
            
            if forecastDay != date {
                
                if let day = actualDay {
                    parsedPerDay.append(day)
                }
                
                date = String(forecastDay)
                actualDay = Day(day: date, dt: forecast.dt)
            }
            actualDay?.forecasts.append(forecast)
        }
        
        if let day = actualDay {
            parsedPerDay.append(day)
        }
        
        return parsedPerDay
    }
    
    // MARK: - Alert View's
    func showErrorWithRetry(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Loading error", message: message, preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry !", style: .default) {
                UIAlertAction in
                self.getForecasts()
            }
            alert.addAction(retryAction)
            self.present(alert, animated: true)
        }
    }
}
