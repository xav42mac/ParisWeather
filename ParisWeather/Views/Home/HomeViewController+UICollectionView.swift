//
//  HomeViewController+UICollectionView.swift
//  ParisWeather
//
//  Created by Xav Mac on 13/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - HomeViewController -> UICollectionView
extension HomeViewController: UICollectionViewDataSource {
    
    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        self.cityForecastPerDay.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayForecastCell",
                                                            for: indexPath) as? DayForecastCell else {
            return UICollectionViewCell()
        }
        
        let dayForecast = self.cityForecastPerDay[indexPath.row]
        var coldestTemp : Double = dayForecast.forecasts.first?.main.temp ?? 0
        var hotestTemp : Double = dayForecast.forecasts.first?.main.temp ?? 0
        
        cell.dateLabel.text = self.createDateTime(timestamp: dayForecast.dt,
                                                  format: "EEEE d MMM yyyy")
        
        for forecast in dayForecast.forecasts {
            
            if  forecast.main.temp < coldestTemp {
                coldestTemp = forecast.main.temp
            } else if forecast.main.temp > hotestTemp {
                hotestTemp = forecast.main.temp
            }
            
            let temperature = self.convertTemp(temp: forecast.main.temp,
                                               from: .kelvin,
                                               to: .celsius)
            
            switch forecast.dtTxt.split(separator: " ")[1] {
            case "00:00:00":
                cell.midnightTempLabel.text = temperature
            case "03:00:00":
                cell.threeHourTempLabel.text = temperature
            case "06:00:00":
                cell.sixHourTempLabel.text = temperature
            case "09:00:00":
                cell.nineHourTempLabel.text = temperature
            case "12:00:00":
                cell.middayTempLabel.text = temperature
            case "15:00:00":
                cell.fifteenHourTempLabel.text = temperature
            case "18:00:00":
                cell.eighteenHourTempLabel.text = temperature
            case "21:00:00":
                cell.twentyoneHourTempLabel.text = temperature
            default:
                break
            }
        }
        
        cell.coldTemperatureLabel.text = self.convertTemp(temp: coldestTemp,
                                                          from: .kelvin,
                                                          to: .celsius)
        
        cell.hotTemperatureLabel.text = self.convertTemp(temp: hotestTemp,
                                                         from: .kelvin,
                                                         to: .celsius)
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    // MARK: - Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Details", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsViewController
            
        controller.dayForecast = self.cityForecastPerDay[indexPath.row]
        
        controller.modalPresentationStyle = .pageSheet
        controller.modalTransitionStyle = .coverVertical
        present(controller, animated: true, completion: nil)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    // MARK: - Custom Flow Layout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
