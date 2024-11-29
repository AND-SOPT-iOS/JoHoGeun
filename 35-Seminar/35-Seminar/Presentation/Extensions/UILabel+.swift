//
//  UILabel+.swift
//  35-Seminar
//
//  Created by 조호근 on 10/22/24.
//

import UIKit

extension UILabel {
    
    func isTextOverflowing(lineLimit: Int) -> Bool {
        guard let text = self.text else { return false }
        
        let maxSize = CGSize(width: self.frame.width, height: .greatestFiniteMagnitude)
        
        let textHeight = (text as NSString).boundingRect(
            with: maxSize,
            options: .usesLineFragmentOrigin,
            attributes: [.font: self.font as Any],
            context: nil
        ).height
        
        let lineHeight = self.font.lineHeight
        let numberOfLines = Int(ceil(textHeight / lineHeight))
        
        return numberOfLines > lineLimit
    }
}
