//
//  AppStoreViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import UIKit
import SnapKit

final class AppStoreViewController: UIViewController {
    
    private var dataSource: AppStoreDataSource!
    
    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setDataSource()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setDataSource() {
        dataSource = AppStoreDataSource(collectionView: collectionView)
        dataSource.delegate = self
    }
    
}

extension AppStoreViewController: TitleHeaderViewDelegate {
    
    func moreButtonTapped(in section: Int) {
        guard let section = AppStoreDataSource.Section(rawValue: section) else { return }
        let detailVC = AppDetailViewController()
        
        switch section {
        case .banner: break
        case .essential:
            detailVC.configure(title: "필수 금융앱")
        case .paid:
            detailVC.configure(title: "유료 앱 순위")
        case .free:
            detailVC.configure(title: "무료 앱 순위")
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

private extension AppStoreViewController {
    
    func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { [weak self] section, _ in
            guard let self,
                  let section = AppStoreDataSource.Section(rawValue: section) else { return nil }
            
            switch section {
            case .banner:
                return createBannerSection()
            case .essential, .paid, .free:
                return createAppSection(for: section)
            }
        }
    }
    
    func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .absolute(350)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 0)
        
        return section
    }
    
    func createAppSection(for section: AppStoreDataSource.Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(80)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        switch section {
        case .essential:
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0)
        case .paid, .free:
            item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0)
        case .banner:
            break
        }
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(260)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 3
        )
        
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .groupPaging
        layoutSection.interGroupSpacing = 16
        
        switch section {
        case .essential:
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 20, bottom: 40, trailing: 20)
        case .paid, .free:
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: -12, leading: 20, bottom: 40, trailing: 20)
        case .banner:
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 20)
        }
        
        let header = createSectionHeader()
        layoutSection.boundarySupplementaryItems = [header]
        
        return layoutSection
    }

    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(40)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        
        header.contentInsets = .zero
        
        return header
    }
    
}

#if DEBUG
import SwiftUI

#Preview {
    AppStoreViewController().toPreview()
}

#endif
