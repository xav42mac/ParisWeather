//
//  DayForecastCell.swift
//  ParisWeather
//
//  Created by Xav Mac on 13/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

class DayForecastCell : UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var coldTemperatureLabel: UILabel!
    @IBOutlet weak var hotTemperatureLabel: UILabel!
    
    @IBOutlet weak var midnightTempLabel: UILabel!
    @IBOutlet weak var threeHourTempLabel: UILabel!
    @IBOutlet weak var sixHourTempLabel: UILabel!
    @IBOutlet weak var nineHourTempLabel: UILabel!
    
    @IBOutlet weak var middayTempLabel: UILabel!
    @IBOutlet weak var fifteenHourTempLabel: UILabel!
    @IBOutlet weak var eighteenHourTempLabel: UILabel!
    @IBOutlet weak var twentyoneHourTempLabel: UILabel!
    
    override func prepareForReuse() {
         super.prepareForReuse()
        
        dateLabel.text = "Date"
        coldTemperatureLabel.text = "- ℃"
        hotTemperatureLabel.text = "- ℃"
        
        midnightTempLabel.text = "- ℃"
        threeHourTempLabel.text = "- ℃"
        sixHourTempLabel.text = "- ℃"
        nineHourTempLabel.text = "- ℃"
        
        middayTempLabel.text = "- ℃"
        fifteenHourTempLabel.text = "- ℃"
        eighteenHourTempLabel.text = "- ℃"
        twentyoneHourTempLabel.text = "- ℃"
    }
}
