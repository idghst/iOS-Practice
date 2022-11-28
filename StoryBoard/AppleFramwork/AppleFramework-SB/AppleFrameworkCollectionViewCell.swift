//
//  AppleFrameworkCollectionViewCell.swift
//  AppleFramework-SB
//
//  Created by 이희승 on 2022/11/21.
//

import UIKit

class AppleFrameworkCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
    
}
