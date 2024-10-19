//
//  UIStackView+.swift
//  35-Seminar
//
//  Created by 조호근 on 10/12/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach{
            addArrangedSubview($0)
        }
    }
    
    func configureStackView(axis: NSLayoutConstraint.Axis = .vertical,
                            distribution: UIStackView.Distribution = .fillProportionally,
                            spacing: CGFloat = 0) {

        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
}

