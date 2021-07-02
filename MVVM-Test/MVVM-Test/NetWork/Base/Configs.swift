//
//  Configs.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import Foundation

struct Configs {
    struct Network {
        // set true for tests and generating screenshots with fastlane
        public static let useStaging = false
        #if DEBUG
        public static let baseUrl = "https://api.github.com/"
        #else
        public static let baseUrl = "https://api.github.com/"
        #endif
    }
}
