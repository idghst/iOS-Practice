//
//  SearchViewModel.swift
//  GithubUserProfile
//
//  Created by idghst on 2023/02/13.
//

import Foundation
import Combine

final class SearchViewModel {
    
    let network: NetworkService

    init(network: NetworkService, selectedUser: UserProfile?) {
        self.network = network
        self.selectedUser = CurrentValueSubject(selectedUser)
    }

    var subscription = Set<AnyCancellable>()

    // output
    let selectedUser: CurrentValueSubject<UserProfile?, Never>
    var name: String {
        return selectedUser.value?.name ?? "n/a"
    }
    var login: String {
        return selectedUser.value?.login ?? "n/a"
    }
    var followers: String {
        guard let value = selectedUser.value?.followers else { return "" }
        return "followers : \(value)"
    }
    var following: String {
        guard let value = selectedUser.value?.following else { return "" }
        return "following : \(value)"
    }
    var imageURL: URL? {
        return selectedUser.value?.avatarUrl
    }


    // input
    func search(keyword: String) {
        let resource = Resource<UserProfile>(
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"]
        )

        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.selectedUser.send(nil)
                case .finished: break
                }
            } receiveValue: { result in
                self.selectedUser.send(result)
            }.store(in: &subscription)
    }
}
