//
//  AppleFrameworkDetailViewController.swift
//  AppleFramework-SB
//
//  Created by idghst on 2023/01/14.
//

import UIKit
import SafariServices
import Combine

class AppleFrameworkDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // Combine
    var subscription = Set<AnyCancellable>()

    // view model
    var viewModel: FrameworkDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }

    private func bind() {
        // input
        viewModel.buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { value in
                URL(string: value.urlString)
            }
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }
            .store(in: &subscription)

        // output
        viewModel.framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }
            .store(in: &subscription)
    }

    @IBAction func learnMoreTapped(_ sender: Any) {
        viewModel.learnMoreTapped()
    }
}
