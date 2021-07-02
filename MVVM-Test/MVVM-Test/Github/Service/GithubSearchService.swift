//
//  GithubSearchService.swift
//  MVVM-Test
//
//  Created by phamtu on 02/07/2021.
//

import Foundation

class GithubSearchService: BaseService {
    func searchRepositories(language: String, sort: String, order: String, page: Int, completion: @escaping (Result<GithubSearchResponse, BaseError>) -> Void) {
        provider.request(MultiTarget(GithubAPI.searchRepositories(q: language, sort: sort, order: order, page: page)), type: GithubSearchResponse.self) { result in
            completion(result)
        }
    }
}
