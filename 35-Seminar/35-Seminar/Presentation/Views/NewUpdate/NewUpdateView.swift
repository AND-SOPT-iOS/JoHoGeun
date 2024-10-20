//
//  NewUpdateView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/20/24.
//

import UIKit
import SnapKit

final class NewUpdateView: UIView {
    
    private let titleLabel = UILabel()
    private let versionLabel = UILabel()
    private let updateDateLabel = UILabel()
    private let versionHistoryButton = UIButton()
    
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
        
    }
    
    private func setUI() {
        self.addSubviews(titleLabel, versionHistoryButton, versionLabel, updateDateLabel)
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
    }
}

#if DEBUG
import SwiftUI

#Preview {
    NewUpdateView().toPreview()
        .frame(width: UIScreen.main.bounds.width)
}

#endif
