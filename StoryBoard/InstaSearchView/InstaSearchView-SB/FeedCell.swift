//
//  FeedCell.swift
//  InstaSearchView-SB
//
//  Created by idghst on 2022/12/17.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // 재사용 준비
    override func prepareForReuse() {
        super.prepareForReuse()
        
        // 이미지 제거(초기화)
        thumbnailImageView.image = nil
    }
    
    func configure(_ imageName: String) {
        // 이미지 설정
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
