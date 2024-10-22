//
//  AppRatingAndReviewView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/22/24.
//

import UIKit
import SnapKit

protocol AppRatingAndReviewViewProtocol: AnyObject {
    func ratingAndReviewTapped()
}

final class AppRatingAndReviewView: UIView {
    
    weak var delegate: AppRatingAndReviewViewProtocol?
    
    private let ratingAndReviewLabel = RatingItemView()
    private let ratingAndReviewButton = UIButton()
    
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
        ratingAndReviewLabel.configure(topText: "평가 및 리뷰", middleText: "4.4", bottomText: "5점 만점", fontSize: .large)
        
        ratingAndReviewButton.configuration = {
            var config = UIButton.Configuration.plain()
            
            let attributes = AttributeContainer([
                .font: UIFont.systemFont(ofSize: 16, weight: .medium)
            ])
            config.attributedTitle = AttributedString("모두 보기", attributes: attributes)
            
            
            return config
        }()
    }
    
    
    private func setUI() {
        self.addSubviews(ratingAndReviewLabel, ratingAndReviewButton)
    }
    
    private func setLayout() {
        ratingAndReviewLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        ratingAndReviewButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
        }
    }
    
    private func setAction() {
        let ratingAndReviewAction = UIAction { [weak self] _ in
            guard let self = self else { return }
            
            self.delegate?.ratingAndReviewTapped()
        }
        ratingAndReviewButton.addAction(ratingAndReviewAction, for: .touchUpInside)
    }
}

#if DEBUG
import SwiftUI

#Preview {
    AppRatingAndReviewView().toPreview()
}
#endif
