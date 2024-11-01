//
//  AppItemCollectionViewCell.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import UIKit
import SnapKit

class AppItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AppItemCollectionViewCell"
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    private let appImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        
        return image
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .tintColor
        config.baseBackgroundColor = .systemGray6
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var container = incoming
            container.font = .systemFont(ofSize: 14, weight: .bold)
            return container
        }
        button.configuration = config
        
        return button
    }()
    
    private let inAppPurchaseLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 내 구입"
        label.font = .systemFont(ofSize: 8)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.isHidden = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.contentView.addSubviews(
            appImageView,
            rankLabel,
            titleLabel,
            subtitleLabel,
            downloadButton,
            inAppPurchaseLabel,
            separatorView
        )
    }
    
    private func setLayout() {
        appImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(appImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(8)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.greaterThanOrEqualTo(72)
            $0.width.lessThanOrEqualTo(100)
            $0.height.equalTo(40)
        }
        
        inAppPurchaseLabel.snp.makeConstraints {
            $0.top.equalTo(downloadButton.snp.bottom).offset(4)
            $0.centerX.equalTo(downloadButton)
        }
        
        separatorView.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.leading)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
    
    
    func configure(
        with item: AppItem,
        isRankVisible: Bool = true,
        isLastCell: Bool = false
    ) {
        rankLabel.isHidden = !isRankVisible
        if isRankVisible {
            rankLabel.text = "\(item.rank)"
        }
        
        appImageView.image = UIImage(named: item.appImage)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        
        inAppPurchaseLabel.isHidden = true
        
        switch item.downloadState {
        case .installed:
            downloadButton.setTitle("열기", for: .normal)
        case .download:
            downloadButton.setTitle("받기", for: .normal)
            inAppPurchaseLabel.isHidden = false
        case .update:
            downloadButton.setTitle("업데이트", for: .normal)
        case .paid(let price):
            downloadButton.setTitle("₩\(price.formattedWithComma)", for: .normal)
        }
        
        separatorView.isHidden = isLastCell
    }
    
}

#if DEBUG
import SwiftUI

#Preview("Example0") {
    let cell = AppItemCollectionViewCell()
    cell.configure(with: AppItem.sampleEssentialDatas[0])
    
    return cell.toPreview()
        .frame(width: UIScreen.main.bounds.width, height: 80)
}

#Preview("Example1") {
    let cell = AppItemCollectionViewCell()
    cell.configure(with: AppItem.sampleEssentialDatas[1])
    
    return cell.toPreview()
        .frame(width: UIScreen.main.bounds.width, height: 80)
}

#endif
