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
    @IBOutlet weak var citySunriseLabel: UILabel!
    @IBOutlet weak var citySunsetLabel: UILabel!
    
    @IBOutlet weak var dayPageControl: UIPageControl!
    @IBOutlet weak var dayPageControlTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var dayForecastCollectionView: UICollectionView!
    
    var cityID : Int = 2968815 // Here Paris ID
    var cityForecast : Forecast?
    var cityForecastPerDay = [Day]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.cityImageView.image = getDynamicBackground()
        
        dayPageControl.transform = self.dayPageControl.transform.rotated(by: .pi/2)
        dayPageControlTrailingConstraint.constant -= dayPageControl.frame.width
        
        self.getForecasts()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        guard let forecast = self.cityForecast else {
            return
        }
        
        actualizeDataOnScreen(forecast: forecast)
    }
}
