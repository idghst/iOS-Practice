//
//  AppleFrameworkViewController.swift
//  AppleFramework-SB
//
//  Created by 이희승 on 2022/11/21.
//

import UIKit
import Combine

class AppleFrameworkViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Combine
    var subscription = Set<AnyCancellable>()
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework // 별명 부여
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        configureCollectionView()
        
        bind()
        
    }
    
    private func bind() {
        // input
        didSelect
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                let storyboard = UIStoryboard(name: "Detail", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "AppleFrameworkDetailViewController") as! AppleFrameworkDetailViewController
                viewController.framework.send(framework)
                self.present(viewController, animated: true)
            }.store(in: &subscription)
        
        // output
        items
            .receive(on: RunLoop.main)
            .sink { [unowned self] list in
                self.applySectionItems(list)
            }.store(in: &subscription)
    }
    
    private func applySectionItems(_ items: [Item], to section: Section = .main) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    private func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleFrameworkCollectionViewCell", for: indexPath) as? AppleFrameworkCollectionViewCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
        
        collectionView.collectionViewLayout = layout()
        
        collectionView.delegate = self
    }
    
    private func layout() -> UICollectionViewLayout {
        
        // 가로 : 가로 길이의 1/3
        // 세로 : 세로 길이 그대로 사용
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // 가로: 가로 길이 그대로 사용
        // 세로: 가로 길이의 1/3을 세로 길이로 설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(4/9))
        let group  = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension AppleFrameworkViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = items.value[indexPath.item]
        print(">>> selected: \(framework.name)")
        didSelect.send(framework)
    }
}
