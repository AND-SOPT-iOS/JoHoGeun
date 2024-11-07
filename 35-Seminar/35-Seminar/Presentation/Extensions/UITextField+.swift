//
//  UITextField+.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import UIKit

extension UITextField {
    
    func setPadding(left: CGFloat = 12, right: CGFloat = 12) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
        self.leftView = leftView
        self.leftViewMode = .always
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.height))
        self.rightView = rightView
        self.rightViewMode = .always
    }
    
}

