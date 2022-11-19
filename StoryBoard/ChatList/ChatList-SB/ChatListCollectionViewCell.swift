//
//  ChatListCollectionViewCell.swift
//  ChatList-SB
//
//  Created by 이희승 on 2022/11/20.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 40
        
    }
    
    func configure(_ chat: Chat) {
        thumbnailImageView.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dateString: chat.date)
    }
    
    // date fomatter
    func formattedDateString(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        if let date = formatter.date(from: dateString) {
//            formatter.dateFormat = "M/d"
            formatter.dateFormat = "yy.MM.dd"
            return formatter.string(from: date)
        }
        else {
            return ""
        }
    }
}
