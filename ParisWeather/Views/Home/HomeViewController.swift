//
//  HomeViewController.swift
//  ParisWeather
//
//  Created by Xav Mac on 11/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - HomeViewController
class HomeViewController: UIViewController {
    
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dayForecastCollectionView: UICollectionView!
    
    private let parisID : Int = 2968815
    var cityForecast : Forecast?
    var cityForecastPerDay = [Day]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.cityImageView.image = getDynamicBackground()
        
        API.shared.getForecastById(id: parisID) { (result) in
            
            if result.isSuccess {
                if let forecast = result.value {
                    self.cityForecast = forecast
                    self.cityForecastPerDay = self.parseForecastListPerDay(list: forecast.list)
                    self.actualizeDataOnScreen(forecast: forecast)
                    return
                }
            }
            
            self.showError(message: result.error?.asServiceError?.errorDescription ?? "Unknown Error")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let forecast = self.cityForecast else {
            return
        }
        
        actualizeDataOnScreen(forecast: forecast)
    }
}
