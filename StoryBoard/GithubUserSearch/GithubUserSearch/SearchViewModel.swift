//
//  SearchViewModel.swift
//  GithubUserSearch
//
//  Created by idghst on 2023/02/13.
//

import Foundation
import Combine

final class SearchViewModel {

    let network: NetworkService

    var subscription = Set<AnyCancellable>()

    init(network: NetworkService) {
        self.network = network
    }

    // output
    @Published private(set) var users: [SearchResult] = []

    // input
    func search(keyword: String) {
        let resource = Resource<SearchUserResponse>(
            base: "https://api.github.com/",
            path: "search/users",
            params: ["q": keyword],
            header: ["Content-Type": "application/json"])

        network.load(resource)
            .map { value in value.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
            .store(in: &subscription)
    }
}
