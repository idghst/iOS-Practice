//
//  HeadSpaceFocusCollectionViewCell.swift
//  HeadSpaceFocus-SB
//
//  Created by idghst on 2023/01/07.
//

import UIKit

class HeadSpaceFocusCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_  item: Focus) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        thumbnailImageView.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal)
    }
    
     
}
