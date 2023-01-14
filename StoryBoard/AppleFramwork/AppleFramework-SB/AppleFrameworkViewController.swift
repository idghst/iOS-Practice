//
//  AppleFrameworkViewController.swift
//  AppleFramework-SB
//
//  Created by 이희승 on 2022/11/21.
//

import UIKit

class AppleFrameworkViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    typealias Item = AppleFramework // 별명 부여
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleFrameworkCollectionViewCell", for: indexPath) as? AppleFrameworkCollectionViewCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        dataSource.apply(snapshot)
        
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
        let framework = list[indexPath.item]
        print(">>> selected: \(framework.name)")
        
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        
        // Storyboard ID 로 스토리보드를 찾는다
        let viewController = storyboard.instantiateViewController(withIdentifier: "AppleFrameworkDetailViewController") as! AppleFrameworkDetailViewController
        
        // framework 데이터를 전달한다
        viewController.framework = framework
        
        // 모달 스타일을 automatic 이 자동으로 설정된다
        // automatic 은 아래로 내려 닫을 수 있다
        // viewController.modalPresentationStyle = .fullScreen // 풀스크린으로 내리기 불가 -> 닫기 버튼 필요
        
        present(viewController, animated: true)
        
    }
}
