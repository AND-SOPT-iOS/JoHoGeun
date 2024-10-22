//
//  AppReviewView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/22/24.
//

import UIKit
import SnapKit

protocol AppReviewViewDelegate: AnyObject {
    func submitButtonTapped()
}

final class AppReviewView: UIView {
    
    weak var delegate: AppReviewViewDelegate?

    private let reviewTitleLabel = UILabel()
    private let starStackView = UIStackView()
    private var starButtons: [UIButton] = []
    private let toastView = ToastView()
    private let reviewCardView = ReviewCardView()
    private let submitButton = UIButton()
    
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
        reviewTitleLabel.text = "탭하여 평가하기:"
        reviewTitleLabel.font = .systemFont(ofSize: 16)
        reviewTitleLabel.textColor = .label
        
        starStackView.axis = .horizontal
        starStackView.spacing = 8
        starStackView.distribution = .fillEqually
        
        for i in 0..<5 {
            let button = UIButton()
            button.setImage(UIImage(systemName: "star"), for: .normal)
            button.setImage(UIImage(systemName: "star.fill"), for: .selected)
            button.tintColor = .systemBlue
            button.tag = i
            starButtons.append(button)
            starStackView.addArrangedSubview(button)
        }
        
        reviewCardView.configure(with: .defaultReview)
        
        submitButton.configuration = {
            var config = UIButton.Configuration.plain()
            
            let attributes = AttributeContainer([
                .font: UIFont.systemFont(ofSize: 16, weight: .medium)
            ])
            config.attributedTitle = AttributedString("모두 보기", attributes: attributes)
            config.titleAlignment = .trailing
            
            config.image = UIImage(systemName: "square.and.pencil")
            config.imagePlacement = .leading
            
            return config
        }()
    }
    
    private func setUI() {
        self.addSubviews(reviewTitleLabel, starStackView, reviewCardView, submitButton, toastView)
    }
    
    private func setLayout() {
        reviewTitleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        starStackView.snp.makeConstraints {
            $0.centerY.equalTo(reviewTitleLabel)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        reviewCardView.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints {
            $0.top.equalTo(reviewCardView.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
        }
        
        toastView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(200)
        }
    }
    
    private func setAction() {
        starButtons.forEach { button in
            let starButtonAction = UIAction { [weak self] action in
                guard let self,
                      let button = action.sender as? UIButton else { return }
                
                let rating = button.tag + 1
                
                // 별점 업데이트
                starButtons.enumerated().forEach { index, button in
                    button.isSelected = index < rating
                }
                
                // 토스트 메시지 표시
                toastView.show(message: "피드백을 보내주셔서 감사합니다.")
            }
            button.addAction(starButtonAction, for: .touchUpInside)
        }
        
        let submitButtonAction = UIAction { [weak self] _ in
            guard let self else { return }
            
            self.delegate?.submitButtonTapped()
        }
        submitButton.addAction(submitButtonAction, for: .touchUpInside)
    }
}

#if DEBUG
import SwiftUI

#Preview {
    AppReviewView().toPreview()
}

#endif
