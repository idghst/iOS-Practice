//
//  HeadSpaceFocusViewController.swift
//  HeadSpaceFocus-SB
//
//  Created by idghst on 2023/01/07.
//

import UIKit

class HeadSpaceFocusViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    
    var curated: Bool = false
    
    var items: [Focus] = Focus.list
    
    enum Section {
        case main
    }
    typealias Item = Focus
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshButton.layer.cornerRadius = 10
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeadSpaceFocusCollectionViewCell", for: indexPath) as? HeadSpaceFocusCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(item)
            return cell
        })
        
        // snapshot
        setItems(items)
        
        collectionView.collectionViewLayout = layout()
        
        // 버튼명 변경
        updateTitle()
    }
    
    private func layout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        curated.toggle()
        
        self.items = curated ? Focus.recommendations : Focus.list
        
        // 버튼명 변경
        updateTitle()
        
        // snapshot
        setItems(items)
    }
    
    // 버튼명 변경 함수
    func updateTitle() {
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
    
    // snapshot
    func setItems(_ items: [Focus]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot)
    }
}
