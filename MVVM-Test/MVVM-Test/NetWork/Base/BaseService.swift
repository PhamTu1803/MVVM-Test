//
//  BaseService.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import Foundation

class BaseService {
    var provider: NetworkProvider!

    public init(isTest: Bool = false) {
        provider = isTest ? NetworkProvider.stubbingNetworking() : NetworkProvider.defaultNetworking()
    }
}
