//
//  UIView+.swift
//  35-Seminar
//
//  Created by 조호근 on 10/20/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
