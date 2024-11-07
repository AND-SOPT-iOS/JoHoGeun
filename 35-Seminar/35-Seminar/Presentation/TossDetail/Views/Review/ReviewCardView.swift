//
//  ReviewCardView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/22/24.
//

import UIKit
import SnapKit

final class ReviewCardView: UIView {
    
    private let titleLabel = UILabel()
    private let starStackView = UIStackView()
    private var stars: [UIImageView] = []
    private let dateLabel = UILabel()
    private let authorLabel = UILabel()
    private let contentLabel = UILabel()
    
    private var review: Review?
    
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
        self.backgroundColor = .systemGray5
        self.layer.cornerRadius = 12
        
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .label
        
        starStackView.axis = .horizontal
        starStackView.distribution = .fillEqually
        
        for _ in 0..<5 {
            let starImageView = UIImageView()
            starImageView.contentMode = .scaleAspectFit
            starImageView.tintColor = .systemYellow
            stars.append(starImageView)
            starStackView.addArrangedSubview(starImageView)
        }
        
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .secondaryLabel
        
        authorLabel.font = .systemFont(ofSize: 12)
        authorLabel.textColor = .secondaryLabel
        
        contentLabel.font = .systemFont(ofSize: 14)
        contentLabel.textColor = .label
        contentLabel.numberOfLines = 0
    }
    
    private func setUI() {
        addSubviews(titleLabel, starStackView, dateLabel, authorLabel, contentLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        starStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        authorLabel.snp.makeConstraints {
            $0.centerY.equalTo(starStackView)
            $0.trailing.equalToSuperview().inset(16)
        }

        contentLabel.snp.makeConstraints {
            $0.top.equalTo(starStackView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.lessThanOrEqualToSuperview().inset(16)
        }
    }
    
    func configure(with review: Review) {
        self.review = review
        
        titleLabel.text = review.title
        updateRatingStars(rating: review.rating)
        dateLabel.text = review.date.formattedString()
        authorLabel.text = review.author
        contentLabel.text = review.content
    }
    
    private func updateRatingStars(rating: Int) {
        stars.enumerated().forEach { index, imageView in
            imageView.image = UIImage(
                systemName: index < rating ? "star.fill" : "star"
            )
        }
    }
}

#if DEBUG
import SwiftUI

#Preview {
    let reviewCardView = ReviewCardView()
    reviewCardView.configure(with: Review.defaultReview)
    
    return reviewCardView.toPreview()
        .frame(width: 300, height: 150)
}
#endif
