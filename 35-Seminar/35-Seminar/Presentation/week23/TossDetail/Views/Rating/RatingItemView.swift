//
//  RatingItemView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/20/24.
//

import UIKit
import SnapKit

final class RatingItemView: UIView {
    
    struct FontSize {
        let top:  CGFloat
        let middle: CGFloat
        let bottom: CGFloat
        
        static let `default` = FontSize(top: 12, middle: 32, bottom: 16)
        static let large = FontSize(top: 20, middle: 32, bottom: 16)
    }
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var middleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var middlePersonView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var bottomStarView: UILabel = {
        let label = UILabel()
        label.text = "★★★★☆"
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    func configure(topText: String, middleText: String? = nil, bottomText: String? = nil, fontSize: FontSize = .default) {
        
        subviews.forEach { $0.removeFromSuperview() }
        
        addSubview(topLabel)
        topLabel.text = topText
        topLabel.font = .systemFont(ofSize: fontSize.top, weight: .bold)
        topLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        if let middleText = middleText {
            middleLabel.font = .systemFont(ofSize: fontSize.middle, weight: .bold)
            addSubview(middleLabel)
            middleLabel.text = middleText
            middleLabel.snp.makeConstraints {
                $0.top.equalTo(topLabel.snp.bottom).offset(12)
                $0.leading.trailing.equalToSuperview()
            }
        } else {
            addSubview(middlePersonView)
            middlePersonView.image = UIImage(systemName: "person.fill")
            middlePersonView.snp.makeConstraints {
                $0.top.equalTo(topLabel.snp.bottom).offset(10)
                $0.centerX.equalToSuperview()
                $0.size.equalTo(40)
            }
        }
        
        if let bottomText = bottomText {
            bottomLabel.font = .systemFont(ofSize: fontSize.bottom, weight: .semibold)
            addSubview(bottomLabel)
            bottomLabel.text = bottomText
            bottomLabel.snp.makeConstraints {
                $0.top.equalTo(middleText != nil ? middleLabel.snp.bottom : middlePersonView.snp.bottom).offset(4)
                $0.leading.trailing.bottom.equalToSuperview()
            }
        } else {
            bottomStarView.font = .systemFont(ofSize: fontSize.bottom, weight: .semibold)
            addSubview(bottomStarView)
            bottomStarView.snp.makeConstraints {
                $0.top.equalTo(middleText != nil ? middleLabel.snp.bottom : middlePersonView.snp.bottom).offset(4)
                $0.leading.trailing.bottom.equalToSuperview()
            }
        }
    }
}

#if DEBUG
import SwiftUI

#Preview {
    let ratingView1 = RatingItemView()
    ratingView1.configure(topText: "8.4만개의 평가", middleText: "4.4")
    
    let ratingView2 = RatingItemView()
    ratingView2.configure(topText: "수상", bottomText: "앱")
    
    let ratingView3 = RatingItemView()
    ratingView3.configure(topText: "연령", middleText: "4+", bottomText: "세")
    
    return HStack(spacing: 10) {
        ratingView1.toPreview()
            .frame(width: 130, height: 90)
        
        ratingView2.toPreview()
                        .frame(width: 130, height: 90)
        
        ratingView3.toPreview()
                        .frame(width: 130, height: 90)
    }
        
}

#endif
