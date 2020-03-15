//
//  HomeViewController.swift
//  ParisWeather
//
//  Created by Xav Mac on 11/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - HomeViewController
class HomeViewController: ViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var cityImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var citySunriseLabel: UILabel!
    @IBOutlet weak var citySunsetLabel: UILabel!
    
    @IBOutlet weak var dayPageControl: UIPageControl!
    @IBOutlet weak var dayPageControlTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var dayForecastCollectionView: UICollectionView!
    
    // MARK: - IBAction
    @IBAction func dayPageControlAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.dayForecastCollectionView.scrollToItem(at: IndexPath(row: self.dayPageControl.currentPage,
                                                                      section: 0),
                                                        at: .top,
                                                        animated: false)
        }
    }
    
    // MARK: - Variables
    var cityID : Int = 2968815 // Here Paris ID
    var cityForecast : Forecast?
    var cityForecastPerDay = [Day]()

    // MARK: - Life Cycle
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
