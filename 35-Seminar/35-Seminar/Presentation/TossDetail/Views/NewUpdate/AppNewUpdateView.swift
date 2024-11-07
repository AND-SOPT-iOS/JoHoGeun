//
//  AppNewUpdateView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/20/24.
//

import UIKit
import SnapKit

protocol AppNewUpdateViewDelegate: AnyObject {
    func versionHistoryButtonTapped()
}

final class AppNewUpdateView: UIView {
    
    weak var delegate: AppNewUpdateViewDelegate?
    
    private let titleLabel = UILabel()
    private let versionLabel = UILabel()
    private let updateDateLabel = UILabel()
    private let versionHistoryButton = UIButton()
    private let descriptionLabel = UILabel()
    
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
        titleLabel.text = "새로운 소식"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        versionLabel.text = "버전 5.183.0"
        updateDateLabel.text = "5일 전"
        
        [versionLabel, updateDateLabel].forEach {
            $0.textColor = .systemGray
            $0.font = .systemFont(ofSize: 14, weight: .medium)
        }
        
        versionHistoryButton.configuration = {
            var config = UIButton.Configuration.plain()
            let attributes = AttributeContainer([
                .font: UIFont.systemFont(ofSize: 16, weight: .medium)
            ])
            config.attributedTitle = AttributedString("버전 기록", attributes: attributes)
            config.contentInsets = .zero
            
            return config
        }()
        
        descriptionLabel.text = """
        • 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 토스 고객센터를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요.
        """
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.lineBreakStrategy = .hangulWordPriority
        descriptionLabel.numberOfLines = 0
        
    }
    
    private func setUI() {
        self.addSubviews(titleLabel, versionHistoryButton, versionLabel, updateDateLabel, descriptionLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview()
        }
        
        versionHistoryButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview()
        }
        
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        updateDateLabel.snp.makeConstraints {
            $0.top.equalTo(versionHistoryButton.snp.bottom).offset(8)
            $0.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(versionLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func setAction() {
        let action = UIAction { [weak self] _ in
            guard let self = self else { return }
            
            self.delegate?.versionHistoryButtonTapped()
        }
        versionHistoryButton.addAction(action, for: .touchUpInside)
    }
}

#if DEBUG
import SwiftUI

#Preview {
    AppNewUpdateView().toPreview()
        .frame(width: UIScreen.main.bounds.width)
}

#endif
