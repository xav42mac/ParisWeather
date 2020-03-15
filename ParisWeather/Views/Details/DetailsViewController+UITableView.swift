//
//  DetailsViewController+UITableView.swift
//  ParisWeather
//
//  Created by Xav Mac on 15/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - DetailsViewController -> UITableView
extension DetailsViewController: UITableViewDataSource {
    
    // MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let numberOfRows = self.dayForecast?.forecasts.count else {
            return 0
        }
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HourForecastCell",
                                                       for: indexPath) as? HourForecastCell,
              let hourForecast = self.dayForecast?.forecasts[indexPath.row] else {
            return UITableViewCell()
        }
        
        let hour = hourForecast.dtTxt.split(separator: " ")[1].description
        
        cell.hourImageView.image = UIImage(named: hour)
        cell.tempLabel.text = self.convertTemp(temp: hourForecast.main.temp,
                                               from: .kelvin,
                                               to: .celsius)
        cell.humidityLabel.text = hourForecast.main.humidity.description + "%"
        cell.cloudLabel.text = hourForecast.clouds.all.description + "%"
        cell.windLabel.text = self.convertSpeed(speed: hourForecast.wind.speed,
                                                from: .metersPerSecond,
                                                to: .kilometersPerHour)
        cell.weatherImageView.image = UIImage(named: hourForecast.weather.first?.icon ?? "default")
        
        return cell
    }
}

extension DetailsViewController: UITableViewDelegate{
    
    // MARK: - Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
