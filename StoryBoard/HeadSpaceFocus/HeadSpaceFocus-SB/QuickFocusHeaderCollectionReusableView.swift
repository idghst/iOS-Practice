//
//  QuickFocusHeaderCollectionReusableView.swift
//  HeadSpaceFocus-SB
//
//  Created by idghst on 2023/01/15.
//

import UIKit

class QuickFocusHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
