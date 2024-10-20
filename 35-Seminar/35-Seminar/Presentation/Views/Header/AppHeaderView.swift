//
//  AppHeaderView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/12/24.
//

import UIKit
import SnapKit

final class AppHeaderView: UIView {
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let openButton = UIButton(configuration: .filled())
    private let shareButton = UIButton(configuration: .plain())
    private let labelStackView = UIStackView()
    private let buttonStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setStyle() {
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemGray4.cgColor
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        subtitleLabel.textColor = .systemGray
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        openButton.configuration = {
            var config = UIButton.Configuration.filled()
            config.cornerStyle = .capsule
            config.baseForegroundColor = .white
            config.baseBackgroundColor = .systemBlue
            
            let attributes = AttributeContainer([
                .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
            ])
            config.attributedTitle = AttributedString("열기", attributes: attributes)
            
            return config
        }()
        
        shareButton.configuration = {
            var config = UIButton.Configuration.plain()
            config.image = UIImage(systemName: "square.and.arrow.up")
            config.preferredSymbolConfigurationForImage = .init(weight: .bold)
            config.baseForegroundColor = .systemBlue
            
            return config
        }()
        
        labelStackView.configureStackView(spacing: 3)
        buttonStackView.configureStackView(axis: .horizontal, distribution: .equalSpacing)
    }
    
    private func setUI() {
        labelStackView.addArrangedSubviews(titleLabel, subtitleLabel)
        buttonStackView.addArrangedSubviews(openButton, shareButton)
        
        self.addSubviews(imageView, labelStackView, buttonStackView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.size.equalTo(120)
        }
        
        openButton.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.height.equalTo(32)
        }
        
        shareButton.snp.makeConstraints {
            $0.size.equalTo(32)
        }
        
        labelStackView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.top)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalTo(imageView.snp.bottom)
            $0.leading.equalTo(labelStackView.snp.leading)
            $0.trailing.equalToSuperview()
        }
    }
    
    func configure(title: String, subtitle: String, image: UIImage?) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
        imageView.image = image
    }
}

#if DEBUG
import SwiftUI

#Preview {
    let appHeaderView = AppHeaderView()
    appHeaderView.configure(title: "토스", subtitle: "금융이 쉬워진다", image: UIImage(named: "toss"))
    
    return appHeaderView.toPreview()
        .frame(width: UIScreen.main.bounds.width, height: 140)
}
#endif
