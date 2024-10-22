//
//  AppPreviewView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/21/24.
//

import UIKit
import SnapKit

final class AppPreviewView: UIView {
    
    private let titleLabel = UILabel()
    private let imageView = UIImageView()
    private let supportedDeviceImageView = UIImageView()
    private let supportedDeviceLabel = UILabel()
    
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
        titleLabel.text = "미리 보기"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        imageView.image = UIImage(named: "toss_preview")
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray.cgColor
        
        supportedDeviceImageView.image = UIImage(systemName: "iphone.gen3")
        supportedDeviceImageView.contentMode = .scaleAspectFill
        supportedDeviceImageView.tintColor = .systemGray
        
        supportedDeviceLabel.text = "iPhone"
        supportedDeviceLabel.font = .systemFont(ofSize: 12, weight: .medium)
        supportedDeviceLabel.textColor = .systemGray
        
    }
    
    private func setUI() {
        self.addSubviews(titleLabel, imageView, supportedDeviceImageView, supportedDeviceLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
            $0.width.equalTo(260)
            $0.height.equalTo(self.snp.width).multipliedBy(3.0 / 2.0)
        }
        
        supportedDeviceImageView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        supportedDeviceLabel.snp.makeConstraints {
            $0.centerY.equalTo(supportedDeviceImageView)
            $0.leading.equalTo(supportedDeviceImageView.snp.trailing).offset(8)
            $0.bottom.lessThanOrEqualToSuperview().offset(-8)
        }
    }
}

#if DEBUG
import SwiftUI

#Preview {
    AppPreviewView().toPreview()
}

#endif
