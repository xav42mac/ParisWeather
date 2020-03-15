//
//  HourForecastCell.swift
//  ParisWeather
//
//  Created by Xav Mac on 15/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - HourForecastCell
class HourForecastCell : UITableViewCell {

    @IBOutlet weak var hourImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    override func prepareForReuse() {
         super.prepareForReuse()
        
        hourImageView.image = UIImage()
        tempLabel.text = "- ℃"
        humidityLabel.text = "- %"
        cloudLabel.text = "- %"
        windLabel.text = "- m/s"
        weatherImageView.image = UIImage()
    }
}
