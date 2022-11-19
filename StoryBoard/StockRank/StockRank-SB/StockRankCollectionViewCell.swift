//
//  StockRankCollectionViewCell.swift
//  StockRank-SB
//
//  Created by 이희승 on 2022/11/20.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    /*
     uicomponent 연결
     uicomponent 에 데이터를 업데이트 하는 코드 넣기
     */
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel){
        
        rankLabel.text = "\(stock.rank)"

        companyImageView.image = UIImage(named: stock.imageName)

        companyNameLabel.text = "\(stock.name)"

        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"

        let color: UIColor
        if stock.diff == 0 {
            color = UIColor.systemGray
        }
        else if stock.diff > 0 {
            color = UIColor.systemRed
        }
        else {
            color = UIColor.systemBlue
        }
        diffLabel.textColor = color
        diffLabel.text = "\(stock.diff) %"
        
    }
    
    // 가격 : 3자리 마다 콤마 찍기
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price))!
        return result
    }
    
}
