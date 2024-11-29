//
//  Int+.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import Foundation

extension Int {
    
    var formattedWithComma: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
    
}
