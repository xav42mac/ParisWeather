//
//  HomeViewController+Extension.swift
//  ParisWeather
//
//  Created by Xav Mac on 13/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func getDynamicBackground() -> UIImage {
        let local = Calendar.current.component(.hour, from: Date())
        
        switch local {
        case 0..<6 : return UIImage(named: "night_paris") ?? UIImage()
        case 6..<12 : return UIImage(named: "morning_paris") ?? UIImage()
        case 12..<20 : return UIImage(named: "afternoon_paris") ?? UIImage()
        case 20..<24 : return UIImage(named: "night_paris") ?? UIImage()
        default: return UIImage(named: "default_paris") ?? UIImage()
        }
    }
    
    func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
        let format = MeasurementFormatter()
        format.numberFormatter.maximumFractionDigits = 0
        format.unitOptions = .providedUnit
        let input = Measurement(value: temp, unit: inputTempType)
        let output = input.converted(to: outputTempType)
        return format.string(from: output)
    }
    
    func actualizeDataOnScreen(forecast: Forecast) {
        
        guard let lastForecast = forecast.list.first else {
            self.showError(message: "No forecast available")
            return
        }
        
        DispatchQueue.main.async {
            self.cityLabel.text = forecast.city.name
            //self.temperatureLabel.text = self.convertTemp(temp: lastForecast.main.temp, from: .kelvin, to: .celsius)
            self.dayForecastCollectionView.reloadData()
        }
    }
    
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
                actualDay = Day(day: date)
            } else {
                actualDay?.forecasts.append(forecast)
            }
        }
        
        return parsedPerDay
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Loading error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}
