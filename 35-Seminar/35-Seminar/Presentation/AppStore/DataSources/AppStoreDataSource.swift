//
//  AppStoreDataSource.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import UIKit

final class AppStoreDataSource {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    enum Section: Int, CaseIterable {
        
        case banner
        case essential
        case paid
        case free
        
        var title: String {
            switch self {
            case .banner: return ""
            case .essential: return "필수 금융앱"
            case .paid: return "유료 앱 순위"
            case .free: return "무료 앱 순위"
            }
        }
        
        var subtitle: String? {
            switch self {
            case .essential: return "금융 생활의 동반자"
            default: return nil
            }
        }
        
        var isRankingSection: Bool {
            self == .paid || self == .free
        }
        
    }
    
    enum Item: Hashable {
        
        case banner(Banner)
        case app(AppItem)
        
    }
    
    weak var delegate: TitleHeaderViewDelegate?
    private weak var collectionView: UICollectionView?
    private var dataSource: DataSource!
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        configureDataSource()
    }
    
    private func configureDataSource() {
        guard let collectionView = collectionView else { return }
        registerCells()
        
        dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { [weak self] collectionView, indexPath, item in
                return self?.cell(collectionView: collectionView, indexPath: indexPath, item: item)
            }
        )
        
        dataSource.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            return self?.supplementaryView(collectionView: collectionView, kind: kind, indexPath: indexPath)
        }
        
        applySnapshot()
    }
    
    private func registerCells() {
        collectionView?.register(BannerCollectionViewCell.self,
                                 forCellWithReuseIdentifier: BannerCollectionViewCell.identifier)
        collectionView?.register(AppItemCollectionViewCell.self,
                                 forCellWithReuseIdentifier: AppItemCollectionViewCell.identifier)
        collectionView?.register(TitleHeaderView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: TitleHeaderView.identifier)
    }
    
    private func cell(
        collectionView: UICollectionView,
        indexPath: IndexPath,
        item: Item
    ) -> UICollectionViewCell {
        switch item {
        case .banner(let banner):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCollectionViewCell.identifier,
                for: indexPath
            ) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: banner)
            return cell
            
        case .app(let appItem):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AppItemCollectionViewCell.identifier,
                for: indexPath
            ) as? AppItemCollectionViewCell else { return UICollectionViewCell() }
            let section = Section(rawValue: indexPath.section)
            let isRankVisible = section?.isRankingSection ?? false
            cell.configure(with: appItem, isRankVisible: isRankVisible)
            return cell
        }
    }
    
    private func supplementaryView(
        collectionView: UICollectionView,
        kind: String,
        indexPath: IndexPath
    ) -> UICollectionReusableView? {
        guard kind == UICollectionView.elementKindSectionHeader,
              let section = Section(rawValue: indexPath.section),
              let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: TitleHeaderView.identifier,
                for: indexPath
              ) as? TitleHeaderView else { return nil }
        
        header.delegate = delegate
        header.configure(
            title: section.title,
            subtitle: section.subtitle,
            section: indexPath.section
        )
        
        return header
    }
    
    private func applySnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections(Section.allCases)
        
        let bannerItems = Banner.sampleBanners.map { Item.banner($0) }
        let essentialItems = AppItem.sampleEssentialDatas.map { Item.app($0) }
        let paidItems = AppItem.samplePaidDatas.map { Item.app($0) }
        let freeItems = AppItem.sampleFreeDatas.map { Item.app($0) }
        
        snapshot.appendItems(bannerItems, toSection: .banner)
        snapshot.appendItems(essentialItems, toSection: .essential)
        snapshot.appendItems(paidItems, toSection: .paid)
        snapshot.appendItems(freeItems, toSection: .free)
        
        dataSource.apply(snapshot)
    }
    
}
