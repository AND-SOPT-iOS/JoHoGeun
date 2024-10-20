//
//  AppRatingView.swift
//  35-Seminar
//
//  Created by 조호근 on 10/20/24.
//

import UIKit

final class AppRatingView: UIView {
    
    private let ratingScoreView = RatingItemView()
    private let awardView = RatingItemView()
    private let ageRatingView = RatingItemView()
    private let firstDividerView = UIView()
    private let secondDividerView = UIView()
    
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
        ratingScoreView.configure(topText: "8.4만개의 평가", middleText: "4.4")
        awardView.configure(topText: "수상", bottomText: "앱")
        ageRatingView.configure(topText: "연령", middleText: "4+", bottomText: "세")
        
        [firstDividerView, secondDividerView].forEach {
            $0.backgroundColor = .systemGray
        }
    }
    
    private func setUI() {
        self.addSubviews(ratingScoreView, firstDividerView, awardView, secondDividerView, ageRatingView)
    }
    
    private func setLayout() {
        let itemWidth = UIScreen.main.bounds.width / 3
        
        ratingScoreView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(itemWidth)
        }
        
        firstDividerView.snp.makeConstraints {
            $0.leading.equalTo(ratingScoreView.snp.trailing)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(40)
        }
        
        awardView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(firstDividerView.snp.trailing)
            $0.width.equalTo(itemWidth)
        }
        
        secondDividerView.snp.makeConstraints {
            $0.leading.equalTo(awardView.snp.trailing)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(40)
        }
        
        ageRatingView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(secondDividerView.snp.trailing)
            $0.width.equalTo(itemWidth)
        }
    }
}

#if DEBUG
import SwiftUI

#Preview {
    AppRatingView().toPreview()
        .frame(width: UIScreen.main.bounds.width, height: 90)
}

#endif

