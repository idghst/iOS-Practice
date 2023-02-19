//
//  NRCOnboardingViewController.swift
//  NRCOnboarding-SB
//
//  Created by idghst on 2022/12/19.
//

import UIKit

class NRCOnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let messages : [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout =
            collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // 페이지 개수 설정
        pageControl.numberOfPages = messages.count
        
    }
}

extension NRCOnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NRCOnboardingCollectionViewCell", for: indexPath) as? NRCOnboardingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let message = messages[indexPath.item]
        cell.configure(message)
        return cell
        
    }
}

extension NRCOnboardingViewController: UICollectionViewDelegateFlowLayout {
    // 그리드 크기 조절
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    // 아이템별 좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    // 아이템별 위아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

extension NRCOnboardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(round(scrollView.contentOffset.x / self.collectionView.bounds.width)) // 반올림하여 정수자리만 남김
        pageControl.currentPage = index
    }
}
