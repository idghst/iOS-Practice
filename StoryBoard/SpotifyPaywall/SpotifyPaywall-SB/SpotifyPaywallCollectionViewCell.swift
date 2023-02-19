//
//  SpotifyPaywallCollectionViewCell.swift
//  SpotifyPaywall-SB
//
//  Created by idghst on 2023/01/14.
//

import UIKit

class SpotifyPaywallCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super .awakeFromNib()
        self.layer.cornerRadius = 16
    } 
    
    func configure (_ info: BannerInfo) {
        titleLabel.text = info.title
        descriptionLabel.text = info.description
        thumbnailImageView.image = UIImage(named: info.imageName)
    }
    
}
