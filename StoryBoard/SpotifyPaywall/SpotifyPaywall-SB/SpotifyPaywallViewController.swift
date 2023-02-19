//
//  SpotifyPaywallViewController.swift
//  SpotifyPaywall-SB
//
//  Created by idghst on 2023/01/14.
//

import UIKit

class SpotifyPaywallViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let bannerInfos: [BannerInfo] = BannerInfo.list
    let colors: [UIColor] = [.systemPurple, .systemOrange, .systemPink, .systemRed]
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = BannerInfo // 별명 부여
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpotifyPaywallCollectionViewCell", for: indexPath) as? SpotifyPaywallCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(item)
            cell.backgroundColor = self.colors[indexPath.item % 4]
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(bannerInfos, toSection: .main)
        dataSource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false
        
        pageControl.numberOfPages = bannerInfos.count
        
    }
    
    private func layout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(200))
        let group  = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        // orthogonalScrollingBehavior -> 공간이 없어도 강제로 오른쪽에 추가하도록 함
        // section.orthogonalScrollingBehavior =.continuous //.continuous -> 연속 스크롤
        section.orthogonalScrollingBehavior = .groupPagingCentered // .groupPaging, .groupPagingCentered -> 그룹별 스크롤
        
        let groupSpacingSize = 20
        section.interGroupSpacing = CGFloat(groupSpacingSize)
        
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
            
            let frameSize = Float(item.first!.frame.width)
            let itemOffset = Float(offset.x)
            let screenSize = Float(env.container.contentSize.width)
            
            let leadingInset = (screenSize - frameSize) / 2
            let index = Int((itemOffset + leadingInset + (frameSize / 2) ) / (frameSize + Float(groupSpacingSize)))
            self.pageControl.currentPage = index
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
