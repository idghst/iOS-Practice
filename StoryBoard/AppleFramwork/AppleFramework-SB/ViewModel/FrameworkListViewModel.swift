//
//  FrameworkListViewModel.swift
//  AppleFramework-SB
//
//  Created by idghst on 2023/02/13.
//

import Foundation
import Combine

final class FrameworkListViewModel {

    init(items: [AppleFramework], selectedItem: AppleFramework? = nil) {
        self.items = CurrentValueSubject(items)
        self.selectedItem = CurrentValueSubject(selectedItem)
    }

    // output
    let items: CurrentValueSubject<[AppleFramework], Never>
    let selectedItem: CurrentValueSubject<AppleFramework?, Never>

    // input
    let didSelect = PassthroughSubject<AppleFramework, Never>()

    func didSelect(at indexPath: IndexPath) {
        let item = items.value[indexPath.item]
        selectedItem.send(item)
    }

}
