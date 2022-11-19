//
//  StockRankViewController.swift
//  StockRank-SB
//
//  Created by 이희승 on 2022/11/20.
//

import UIKit

class StockRankViewController: UIViewController {
    
    let stockList: [StockModel] = StockModel.list

    @IBOutlet weak var collectionView: UICollectionView!
    
    /*
     Data, Presentation, Layout
     Data           어떤 데이터?
     Presentation   셀을 어떻게?
     Layout         셀을 어떻게 배치?
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

    }

}

extension StockRankViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath)
        as? StockRankCollectionViewCell
        else {  return UICollectionViewCell() }
        
        let stock = stockList[indexPath.item]
        
        cell.configure(stock)
        
        return cell
    }
    
    
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout{
    /*
     width = collectionView
     80
     
     
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
}
