//
//  UIImageView+Extension.swift
//  ParisWeather
//
//  Created by Xav Mac on 15/03/2020.
//  Copyright © 2020 ParisWeather. All rights reserved.
//

import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
