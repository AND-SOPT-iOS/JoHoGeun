//
//  RatingItemView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/20/24.
//

import UIKit
import SnapKit

final class RatingItemView: UIView {
    
    private let topLabel = UILabel()
    private lazy var middleLabel = UILabel()
    private lazy var middlePersonView = UIImageView()
    private lazy var bottomLabel = UILabel()
    private lazy var bottomStarView = UILabel()
    
    init(topText: String, middleText: String? = nil, bottomText: String? = nil) {
        super.init(frame: .zero)
        
        setStyle(topText: topText, middleText: middleText, bottomText: bottomText)
        setUI(topText: topText, middleText: middleText, bottomText: bottomText)
        setLayout(topText: topText, middleText: middleText, bottomText: bottomText)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setStyle(topText: String, middleText: String? = nil, bottomText: String? = nil) {
        
        topLabel.text = topText
        topLabel.font = .systemFont(ofSize: 12, weight: .bold)
        topLabel.textColor = .systemGray
        topLabel.textAlignment = .center
        
        if let middleText = middleText {
            middleLabel.text = middleText
            middleLabel.font = .systemFont(ofSize: 32, weight: .bold)
            middleLabel.textColor = .systemGray
            middleLabel.textAlignment = .center
        } else {
            middlePersonView.image = UIImage(systemName: "person.fill")
            middlePersonView.tintColor = .systemGray
            middlePersonView.contentMode = .scaleAspectFit
        }
        
        if let bottomText = bottomText {
            bottomLabel.text = bottomText
            bottomLabel.font = .systemFont(ofSize: 24, weight: .semibold)
            bottomLabel.textColor = .systemGray
            bottomLabel.textAlignment = .center
        } else {
            bottomLabel.isHidden = true
            bottomStarView.text = "★★★★☆"
            bottomStarView.font = .systemFont(ofSize: 20)
            bottomStarView.textColor = .systemGray
            bottomStarView.textAlignment = .center
        }
    }
    
    private func setUI(topText: String, middleText: String? = nil, bottomText: String? = nil) {
        addSubview(topLabel)
        
        if middleText != nil {
            addSubview(middleLabel)
        } else {
            addSubview(middlePersonView)
        }
        
        if bottomText != nil {
            addSubview(bottomLabel)
        } else {
            addSubview(bottomStarView)
        }
    }
    
    private func setLayout(topText: String, middleText: String? = nil, bottomText: String? = nil) {
        topLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        if middleText != nil {
            middleLabel.snp.makeConstraints {
                $0.top.equalTo(topLabel.snp.bottom).offset(12)
                $0.leading.trailing.equalToSuperview()
            }
        } else {
            middlePersonView.snp.makeConstraints {
                $0.top.equalTo(topLabel.snp.bottom).offset(12)
                $0.centerX.equalToSuperview()
                $0.size.equalTo(32)
            }
        }
        
        if bottomText != nil {
            bottomLabel.snp.makeConstraints {
                $0.top.equalTo(middleText != nil ? middleLabel.snp.bottom : middlePersonView.snp.bottom).offset(4)
                $0.leading.trailing.bottom.equalToSuperview()
            }
        } else {
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
    Spacer()
    RatingItemView(topText: "8.4만개의 평가", middleText: "4.4").toPreview()
        .frame(width: 130, height: 90)
    Spacer()
    RatingItemView(topText: "수상", bottomText: "앱").toPreview()
        .frame(width: 130, height: 90)
    Spacer()
    RatingItemView(topText: "연령", middleText: "4+", bottomText: "세").toPreview()
        .frame(width: 130, height: 90)
    Spacer()
}

#endif
