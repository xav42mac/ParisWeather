//
//  ViewController.swift
//  ParisWeather
//
//  Created by Xav Mac on 15/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

// MARK: - ViewController
class ViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Dynamic Background
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
    
    // MARK: - Temperature Convertion
    func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
        let format = MeasurementFormatter()
        format.numberFormatter.maximumFractionDigits = 0
        format.unitOptions = .providedUnit
        let input = Measurement(value: temp, unit: inputTempType)
        let output = input.converted(to: outputTempType)
        return format.string(from: output)
    }
    
    // MARK: - Speed Convertion
    func convertSpeed(speed: Double, from inputTempType: UnitSpeed, to outputTempType: UnitSpeed) -> String {
        let format = MeasurementFormatter()
        format.numberFormatter.maximumFractionDigits = 0
        format.unitOptions = .providedUnit
        let input = Measurement(value: speed, unit: inputTempType)
        let output = input.converted(to: outputTempType)
        return format.string(from: output)
    }
    
    // MARK: - Convert Unix timestamp to formatted string
    func createDateTime(timestamp: Int, format: String) -> String {
        var strDate = "undefined"
            
        let date = Date(timeIntervalSince1970: Double(timestamp))
        let dateFormatter = DateFormatter()
        let timezone = TimeZone.current.abbreviation() ?? "UTC"
        dateFormatter.timeZone = TimeZone(abbreviation: timezone)
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = format
        strDate = dateFormatter.string(from: date)
            
        return strDate
    }

    // MARK: - Alert View's
    func showError(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Loading error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}
