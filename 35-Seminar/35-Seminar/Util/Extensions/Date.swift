//
//  Date.swift
//  35-Seminar
//
//  Created by 조호근 on 10/23/24.
//

import Foundation

extension Date {
    func formattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일"
        return formatter.string(from: self)
    }
}
