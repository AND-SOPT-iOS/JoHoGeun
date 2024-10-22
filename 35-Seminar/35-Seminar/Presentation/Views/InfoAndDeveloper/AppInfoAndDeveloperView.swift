//
//  AppInfoAndDeveloperView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/21/24.
//

import UIKit

protocol AppInfoAndDeveloperViewDelegate: AnyObject {
    func developerButtonTapped()
}

final class AppInfoAndDeveloperView: UIView {
    
    weak var delegate: AppInfoAndDeveloperViewDelegate?
    
    private let descriptionLabel = UILabel()
    private var moreButton: UIButton?
    private let developerButton = UIButton()
    
    private let fullDescription = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다. 내 금융 현황을 한눈에, 홈소비 토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다. 내 금융 현황을 한눈에, 홈소비 토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다. 내 금융 현황을 한눈에, 홈소비"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setStyle() {
        descriptionLabel.text = fullDescription
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .medium)
        descriptionLabel.numberOfLines = 3
        
        developerButton.configuration = {
            var config = UIButton.Configuration.plain()
            
            var titleContainer = AttributeContainer()
            titleContainer.font = .systemFont(ofSize: 16, weight: .regular)
            titleContainer.foregroundColor = .systemBlue
            config.attributedTitle = AttributedString("Viva Republica", attributes: titleContainer)
            
            var subtitleContainer = AttributeContainer()
            subtitleContainer.font = .systemFont(ofSize: 14, weight: .regular)
            subtitleContainer.foregroundColor = .systemGray
            config.attributedSubtitle = AttributedString("개발자", attributes: subtitleContainer)
            
            config.titleAlignment = .leading
            
            config.image = UIImage(systemName: "chevron.right")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
            config.imagePlacement = .trailing
            
            config.buttonSize = .large
            
            return config
        }()
        
        developerButton.contentHorizontalAlignment = .fill
    }
    
    private func setUI() {
        self.addSubviews(descriptionLabel, developerButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 라벨이 레이아웃된 후 오버플로우 여부 확인
        if moreButton == nil, descriptionLabel.isTextOverflowing(lineLimit: 3) {
            let button = UIButton()
            button.configuration = {
                var config = UIButton.Configuration.plain()
                let attributes = AttributeContainer([
                    .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
                ])
                config.attributedTitle = AttributedString("더보기", attributes: attributes)
                config.contentInsets = .zero
                return config
            }()
            
            self.moreButton = button
            self.addSubview(button)
            setButtonLayout()
            setAction()
        }
    }
    
    private func setLayout() {
        descriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        
        developerButton.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setButtonLayout() {
        moreButton?.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        if let moreButton = moreButton {
            developerButton.snp.remakeConstraints {
                $0.top.equalTo(moreButton.snp.bottom)
                $0.leading.trailing.equalToSuperview()
            }
        }
    }
    
    private func setAction() {
        if let moreButton = moreButton {
            let moreButtonAction = UIAction { [weak self] _ in
                guard let self = self else { return }
                
                self.descriptionLabel.numberOfLines = 0
                moreButton.isHidden = true
                self.setNeedsLayout()
            }
            moreButton.addAction(moreButtonAction, for: .touchUpInside)
        }
        
        let developerButtonAction = UIAction { [weak self] _ in
            guard let self else { return }
            
            self.delegate?.developerButtonTapped()
        }
        developerButton.addAction(developerButtonAction, for: .touchUpInside)
    }
}

#if DEBUG
import SwiftUI

#Preview {
    AppInfoAndDeveloperView().toPreview()
        .frame(width: UIScreen.main.bounds.width, height: 300)
}
#endif
