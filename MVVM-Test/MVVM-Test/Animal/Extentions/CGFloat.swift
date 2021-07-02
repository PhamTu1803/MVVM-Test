//
//  CGFloat.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
