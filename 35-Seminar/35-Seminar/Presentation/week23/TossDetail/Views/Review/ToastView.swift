//
//  ToastView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/23/24.
//

import UIKit
import SnapKit

final class ToastView: UIView {
    
    private let imageView = UIImageView()
    private let messageLabel = UILabel()
    
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
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 12
        self.alpha = 0
        
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemGray2
        
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.textColor = .systemGray2
        messageLabel.textAlignment = .center
    }
    
    private func setUI() {
        addSubviews(imageView, messageLabel)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-20)
            $0.size.equalTo(100)
        }
        
        messageLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(imageView.snp.bottom).offset(12)
        }
    }
    
    func show(message: String, icon: UIImage? = UIImage(systemName: "star.fill")) {
        imageView.image = icon
        messageLabel.text = message
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 1
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                UIView.animate(withDuration: 0.3) {
                    self.alpha = 0
                }
            }
        }
    }
}
