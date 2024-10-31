//
//  BannerCollectionViewCell.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import UIKit
import SnapKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BannerCollectionViewCell"
    
    private let badgeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .systemBlue
        
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .label
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let appImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        
        return image
    }()
    
    private let overlayAppImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        
        return image
    }()

    private let overlayTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    private let overlayDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .systemGray
        
        return label
    }()
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .gray.withAlphaComponent(0.4)
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
            badgeLabel,
            titleLabel,
            subtitleLabel,
            appImageView,
            overlayAppImageView,
            overlayTitleLabel,
            overlayDescriptionLabel,
            downloadButton,
            inAppPurchaseLabel
        )
    }
    
    private func setLayout() {
        badgeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(badgeLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
        }
        
        appImageView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(240)
        }
        
        overlayAppImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalTo(appImageView.snp.bottom).offset(-16)
            $0.size.equalTo(40)
        }
        
        downloadButton.snp.makeConstraints {
            $0.trailing.equalTo(appImageView.snp.trailing).inset(16)
            $0.centerY.equalTo(overlayAppImageView)
            $0.width.greaterThanOrEqualTo(72)
            $0.width.lessThanOrEqualTo(100)
            $0.height.equalTo(32)
        }
        
        overlayTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(overlayAppImageView.snp.trailing).offset(8)
            $0.trailing.lessThanOrEqualTo(downloadButton.snp.leading).inset(2)
            $0.bottom.equalTo(overlayAppImageView.snp.centerY)
        }
        
        overlayDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(overlayTitleLabel.snp.leading)
            $0.trailing.lessThanOrEqualTo(downloadButton.snp.leading).inset(2)
            $0.top.equalTo(overlayTitleLabel.snp.bottom).offset(2)
        }
        
        inAppPurchaseLabel.snp.makeConstraints {
            $0.top.equalTo(downloadButton.snp.bottom).offset(4)
            $0.centerX.equalTo(downloadButton)
        }
    }
    
    func configure(with banner: Banner) {
        badgeLabel.text = banner.badge
        titleLabel.text = banner.title
        subtitleLabel.text = banner.subtitle
        
        appImageView.image = UIImage(named: banner.bannerImage)
        overlayAppImageView.image = UIImage(named: banner.AppImage)
        
        overlayTitleLabel.text = banner.title
        overlayDescriptionLabel.text = banner.description
        
        switch banner.downloadState {
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
    }
    
}



#if DEBUG
import SwiftUI

#Preview {
    let cell = BannerCollectionViewCell()
    cell.configure(with: Banner.sampleBanners[3])
    
    return cell.toPreview()
        .frame(width: UIScreen.main.bounds.width, height: 400)
}

#endif
