//
//  DownloadState.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import Foundation

enum DownloadState: Hashable {
    
    case installed
    case download
    case update
    case paid(price: Int)
    
    var title: String {
        switch self {
        case .installed:
            return "설치됨"
        case .download:
            return "받기"
        case .update:
            return "업데이트"
        case .paid(let price):
            return "₩\(price.formattedWithComma)"
        }
    }
    
}
