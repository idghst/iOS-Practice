//
//  FrameworkDetailViewModel.swift
//  AppleFramework-SB
//
//  Created by idghst on 2023/02/13.
//

import Foundation
import Combine

final class FrameworkDetailViewModel {

    init(framework: AppleFramework) {
        self.framework = CurrentValueSubject(framework)
    }

    // output
    let framework: CurrentValueSubject<AppleFramework, Never>

    // input
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()

    func learnMoreTapped() {
        buttonTapped.send(framework.value)
    }

}
