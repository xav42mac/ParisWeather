//
//  DetailsViewController.swift
//  ParisWeather
//
//  Created by Xav Mac on 12/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - DetailsViewController
class DetailsViewController: ViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var forecastsTableView: UITableView!
    
    // MARK: - Variables
    var dayForecast : Day?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.forecastsTableView.allowsSelection = false
    }
}
