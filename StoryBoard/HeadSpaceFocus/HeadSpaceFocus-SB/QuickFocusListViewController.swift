//
//  QuickFocusListViewController.swift
//  HeadSpaceFocus-SB
//
//  Created by idghst on 2023/01/15.
//

import UIKit

class QuickFocusListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let breathingList = QuickFocus.breathing
    let walkingList = QuickFocus.walking
    
    enum Section: CaseIterable {
        case breath
        case walking
        
        var title: String {
            switch self {
            case .breath:
                return "Breathing exercise"
            case .walking:
                return "Mindful walks"
            }
        }
    }
    
    typealias Item = QuickFocus
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusListCollectionViewCell", for: indexPath) as? QuickFocusListCollectionViewCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
        
        datasource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "QuickFocusHeaderCollectionReusableView", for: indexPath) as? QuickFocusHeaderCollectionReusableView else {
                return nil
            }
            
            let allSection = Section.allCases
            let section = allSection[indexPath.section]
            
            header.configure(section.title)
            return header
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.breath, .walking])
        snapshot.appendItems(breathingList, toSection: .breath)
        snapshot.appendItems(walkingList, toSection: .walking)
        datasource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func layout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 20, bottom: 30, trailing: 20)
        section.interGroupSpacing = 20
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}
