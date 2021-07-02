//
//  UIImageView.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
